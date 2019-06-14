;;;; utility.lisp

;; Generates the range of integers [1, x] (inclusive).
(defun range (x)
  (loop for i from 1 to x collect i))

;; TODO Replace this with a builtin if possible.
(defun keyassoc (key list)
  (if list
      (if (eq key (car list))
          (cadr list)
          (keyassoc key (cdr list)))
      nil))

;; If test is true return test, otherwise do else.
;; TODO Modify so that else is a &rest argument.
(defmacro rif (test else)
  (let ((sym (gensym)))
    `(let ((,sym ,test))
       (if ,sym ,sym ,else))))

(defun read-string-from-file (stream)
  (let ((contents (make-string (file-length stream))))
      (read-sequence contents stream)
      contents))
