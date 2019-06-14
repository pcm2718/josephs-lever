#!/bin/sh
# TODO Add a system for specifying a CL implementation
sbcl --noinform \
     --eval "(ql:quickload \"josephs-lever\")" \
     --eval "(render-passage t #'render-page (gen-passage (list (cons \"eng\" (toc-fu *toc*)))))" \
     --quit
