;;;; passage.lisp

;;; Processes the Table of Contents and the language map.

(defparameter *langmap* (with-open-file (fd "langmap.lisp") (read fd)))

;; TODO Should cache scanner with let closure.
(defun gen-work-lexer (names url)
  ;; TODO Check for an exact match with the name or abbreviation at
  ;; the moment, this will be upgraded to a regex type solution later.
  (lambda (str)
    (loop for name in names
          for (res rump) = (multiple-value-list (cl-ppcre:scan-to-strings (format nil "^[:\\s]*~A\\s+(.*)" name) str))
          do (if res (return (values url (aref rump 0)))) 
          finally (return nil)); (if (find str names :test #'string=) url)
    ))

;; Matchers for numbers are chached to avoid excessive memory consumption
(let ((matchers '()))
  (defun gen-number-lexer (n)
    (rif (nth (1- n) matchers)
         ;; TODO There's a better way to do this. May involve caching
         ;; the scanner.
         ;; TODO Compile time the write-to-string and format.
         ;; Appending to matchers works like this because chapters
         ;; don't skip numbers and are ordered.
         (let ((matcher (lambda (str)
                          (let ((res
                                  (multiple-value-list
                                   (cl-ppcre:scan-to-strings (format nil "^[:\\s]*(~A)\\s+(.*)" n) str))))
                            ;; TODO Res probably shouldn't be (nil).
                            (if (car res)
                                (destructuring-bind (res rump) res
                                  (values (aref rump 0) (aref rump 1))))))))
           (setf matchers (append matchers (list matcher)))
           matcher))))

(let ((chnum 0))
  (defun massage-chapter (toc)
    (setf chnum (1+ chnum))
    (list (gen-number-lexer chnum)
          (mapcar #'(lambda (x) (list (gen-number-lexer x) '(t))) (range toc))))
  (defun massage-work (toc)
    (setf chnum 0)
    (list (gen-work-lexer (list (car toc) (keyassoc :abbr toc)) (keyassoc :url toc))
          (mapcar #'massage-toc (car (last toc))))))

(defun massage-toc (toc)
  (if (numberp toc)
      ;; We've hit a chapter-verse-count element.
      (massage-chapter toc)
      ;; We've hit another named book or work.
      (massage-work toc))) 

(defparameter *toc* (massage-toc (with-open-file (fd "toc.lisp") (read fd))))

(defun remove-bible (toc)
  (list
   "Standard Works"
   :abbr "sw" :url "scriptures" :virtual
   (cddr (car (last toc)))))
(defparameter *toc-sans-bible* (remove-bible *toc*))

;;; toc-fu is an interim approach to generating passages while the
;;; parser is still under development

(defun toc-fu-contents (contents)  
  (loop with i = 1
        for c in contents
        when (numberp c)
          collect (list (write-to-string i) (range c))
          and do (setf i (1+ i))
        when (listp c)
          collect (toc-fu c)))

(defun toc-fu (toc)
  (cons (keyassoc :url toc)
        (when (listp (car (last toc))) (toc-fu-contents (car (last toc))))))

;;; Code for parsing and validating passages.

;; NOTE lang an entry in *langmap*, not a string.
(defun get-lang-toc (lang)
  (if (find :bible lang) *toc* *toc-sans-bible*))

(defun parse-lang (pstr)
  (cl-ppcre:register-groups-bind
      (token rump) ("\\s*(\\w+)(.*)" pstr)
    (loop for lang in *langmap*
          if (find token lang :test #'string=)
            do (return (list token rump (get-lang-toc lang)))
               ;; English is the default language.
               ;; TODO Add log message?
          finally (return (list "eng" pstr)))))

(defun parse-simple-passage-toc (pstr url toc)
  (if (or (eq t toc) (cl-ppcre:scan "^\s*$" pstr))
      ;; We've hit the bottom or the end of pstr. Return the url.
      url
      ;; We haven't hit bottom and we have more pstr to go.
      (multiple-value-bind (res rump) (funcall (car toc) pstr)
        (if res
            ;; The current work matches, check the children.
            (loop with pstr = rump
                  with url = (cons res url)
                  for toc in (cadr toc)
                  for ret = (parse-simple-passage-toc pstr url toc)
                  when ret
                    do (return ret)
                  finally (return nil))))
      ))

;; NOTE A simple passage is one not containing the union operator ','.
(defun parse-simple-passage (pstr)
  (multiple-value-bind (lang toc) (parse-lang pstr)
    (cons lang (parse-simple-passage-toc pstr '() toc))))

(defun parse-passage (pstr)
  (loop for simple in (cl-ppcre:split "," pstr)
        collect (parse-simple-passage pstr)))

(defun gen-pages (context tree)
  ;; Find a better work around for this.
  (if (stringp (car tree))
      (apply #'concatenate 'list
             (mapcar #'(lambda (x)
                         (gen-pages
                          (concatenate 'string  context "/" (car tree)) x))
                     (cdr tree)))
      (list (cons context tree))))

(defun gen-url-for-page (lang path)
  (concatenate 'string path "?lang=" lang))

(defun gen-path-for-page (lang path)
  (concatenate 'string "/" lang path))

(defun gen-passage-lang (lang passage)
  (mapcar #'(lambda (p)
              (let ((path (car p)))
                (cons
                 (gen-path-for-page lang path)
                 (cons
                  (gen-url-for-page lang path)
                  (cdr p)))))
          (gen-pages "" passage)))

(defun gen-passage (passage)
  (apply #'append
         (mapcar #'(lambda (lang)
                     (gen-passage-lang (car lang) (cdr lang)))
                 passage)))

;;; Implementation of read-macro syntax for verse notation.

(defun parse-passage-r (stream toccon)
  ;; If whitespace wasn't consumed by the previous operation it don't
  ;; matter.
  ()
  ;; Check to see if the expression is closed and close it if it is.
  ;; (if (eq #\] (peek-char :stream stream))
  ;;   (read-char))
  ;; Attempt to match grammatical particles first to govern tree
  ;; taversal.

  ;; If grammatical particles are not matched, try to match from the
  ;; current context in the Table of Contents.

  ;; If the current context is virtual, descend a level.

  ;; If no match is possible, the parse at this level is complete.
  )
;; TODO If the stream isn't empty at the end of a parse, it should be
;; considered an error for now.

;; Use braces.
;; (set-macro-character #\] (get-macro-character #\)))
;; (set-dispatch-macro-character #\# #\[
;;                               #'(lambda (stream char1 char2)
;;                                   (parse-passage stream)))
