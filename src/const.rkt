#lang racket
(provide *project-name* *version-message*)

(define *project-name* "Gophwr")
(define *project-version* "v0.0.1")

(define *version-message*
  (list
   (string-append *project-name* " " *project-version*)
   "Copyright (C) 2019 Erkin Batu Altunbaş"
   ""
   "Each of this project's source code is subject "
   "to the terms of the Mozilla Public Licence v2.0"
   "If a copy of the MPL was not distributed with this "
   "file, you can obtain one at https://mozilla.org/MPL/2.0/"))
