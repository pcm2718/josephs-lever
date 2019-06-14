;;;; render.lisp

(let ((verses nil))
  (defun dfs-verses-r (content)
    (cond
      ((atom content) nil)
      ((and (listp (car content))
            (string= (keyassoc :ID (car content)) (car verses)))
       (setf verses (cons (format nil "p~D" (cadr verses)) (cddr verses)))
       (list content))
      (t (apply #'append (mapcar #'dfs-verses-r content)))))
  (defun dfs-verses (content v)
    (setf verses (cons (format nil "p~D" (car v)) (cdr v)))
    (dfs-verses-r content)))

(defun render-verse (content)
  (cond ((stringp content) content)
        ((eq :RUBY (car content)) (cadr (cadr content)))
        ((atom (car content)) "")
        ((string= (keyassoc :CLASS (car content)) "verse")
         (apply #'concatenate 'string (mapcar 'render-verse (cdr content))))
        ((string= (keyassoc :CLASS (car content)) "study-note-ref")
         (apply #'concatenate 'string (mapcar 'render-verse (cdr content))))
        ((string= (keyassoc :CLASS (car content)) "clarity-word")
         (apply #'concatenate 'string (mapcar 'render-verse (cdr content))))
        (t "")))

(defun render-page (content verses)
  (let ((content (plump-sexp:serialize (plump:parse content))))
    (apply #'concatenate 'string
                 (loop for verse in (mapcar #'render-verse (dfs-verses content verses))
                       collect (format nil "~A~%" verse)))))

;; TODO Passages a &rest argument?
(defun render-passage (outstream renderer passage)
  (loop for path in (fetch-passage-pages passage)
        and verses in (mapcar #'cddr passage)
        ;; NOTE passage needs to be passed to the parser for superior granularity.
        do (with-open-file (fd path)
             (format outstream "~A" (funcall renderer (read-string-from-file fd) verses)))))
