;;;; josephs-lever.asd

(defpackage :josephs-lever (:use :cl :asdf))
(in-package :josephs-lever)

(defsystem josephs-lever
  :name "Joseph's Lever"
  :author "Parker Michaelson"
  :version "0.1"
  :maintainer "Parker Michaelson"
  :description "A utility for scraping and formatting the Standard\
  Works of the Church of Jesus Christ of Latter-day Saints."
  ;; TODO Fix
  :long-description ""
  :components ((:file "defaults")
               (:file "utility")
               (:file "passage")
               (:file "fetch")
               (:file "render"))
  :depends-on ("dexador"
               "plump"
               "plump-sexp"))
