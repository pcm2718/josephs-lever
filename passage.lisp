;;;; passage.lisp

;; Processes the Table of Contents and the language map.
(defparameter *toc* (with-open-file (fd "toc.lisp") (read fd)))
(defparameter *langmap* (with-open-file (fd "langmap.lisp") (read fd)))

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

;;; This is the actual code that will be used.

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

(defun parse-passage (stream)
  ;; The default language is English.
  ;; (let (("eng"))
  ;;   (for lang in *langmap*
  ;;        when (funcall (car lang) )
  ;;        ;; Right now this 
  ;;        (for name in )))
  (parse-passage-r stream nil)
  )

(defun gen-passage (passage)
  (apply #'append
         (mapcar #'(lambda (lang)
                     (gen-passage-lang (car lang) (cdr lang)))
                 passage)))

;; Use braces.
;; (set-macro-character #\] (get-macro-character #\)))
;; (set-dispatch-macro-character #\# #\[
;;                               #'(lambda (stream char1 char2)
;;                                   (parse-passage stream)))
