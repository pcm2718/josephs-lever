;;;; defaults.lisp
;;;; Default "user configurable" settings.

;; Seconds to wait in-between page fetches from *web-root*
(defparameter *web-fetch-pause* 1)

;; The root location of the Standard Works.
(defparameter *web-root* "https://www.churchofjesuschrist.org/study")

;; The root of the local cache of pages from *web-root*
;; NOTE If *cache-dir* is set to nil caching will be disabled.
(defparameter *cache-dir* "~/.cache/josephs-lever")
