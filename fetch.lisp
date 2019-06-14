;;;; fetch.lisp

(defun gen-url-from-page (page)
  (concatenate 'string *web-root* (cadr page)))

(defun gen-path-from-page (page)
  (concatenate 'string *cache-dir* (car page)))

;; TODO Make double caching safe.
(defun cache-page (page content)
  (let ((path (gen-path-from-page page)))
    (ensure-directories-exist path :verbose t)
    (with-open-file (fd path :direction :output)
      (princ content fd))
    ;; TODO Relocate this line?
    path))

(defun fetch-page-web (page)
  (let ((res (dex:get (gen-url-from-page page))))
    (format t "Fetched page ~A from web.~%" (cadr page))
    (sleep *web-fetch-pause*)
    (cache-page page res)
    ;; TODO Do something if the page fetch is not successful.
    ))

(defun fetch-page-cache (page)
  (and *cache-dir*
       (let ((path (gen-path-from-page page)))
         (when (probe-file path)
           path))))

(defun fetch-passage-pages (passage)
  (loop for page in passage
        collect (rif (fetch-page-cache page)
                     (fetch-page-web page))))
