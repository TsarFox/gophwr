#lang racket/base
(provide (rename-out (bookmarks user-bookmarks))
         (except-out (all-defined-out)
                     define-preference
                     define-colour))

(require racket/class
         racket/draw
         racket/file)
(require "const.rkt")


(define debug-mode? (make-parameter #f))

(define config-file (build-path (find-system-path 'pref-dir)
                                (string-append project-name ".rktd")))

(define tls-enabled? (make-parameter #f))


;;; Note: This code is for hard-coded *default* values.
;;; Adjust the gophwr.rktd config file to override them.

;;; Preferences
(define-syntax-rule (define-preference symbol default)
  (define symbol
    (get-preference (quote symbol) (λ () default)
                    'timestamp config-file)))

(define (save-preferences names vals)
  (put-preferences names vals #f config-file))

(define-preference homepage project-home)
(define-preference download-folder #f)

(define-preference bookmarks '(("Veronica-2" "floodgap.com/1/v2")))

(define-preference wheel-step 3)
(define-preference auto-wrap? #f)

(define-preference initial-width 1024)
(define-preference initial-height 768)

(define-preference font-name #f)
(define-preference font-size 11)
(define-preference title-size 23)

;;; Colours
(define-syntax-rule (define-colour colour rgb)
  (define colour
    (let ((colour (get-preference (quote colour) (λ () rgb) 'timestamp config-file)))
      (cond ((list? colour)
             (apply make-color colour))
            ((string? colour)
             (make-object color% colour))))))

(define-colour address-bg-colour "white")
(define-colour address-success-colour "greenyellow")
(define-colour address-error-colour "peachpuff")

(define-colour fg-colour '(#xEE #xEE #xEE))
(define-colour bg-colour '(#x11 #x11 #x11))

(define-colour menu-colour     '(#xAA #xAA #xEE))
(define-colour link-colour     '(#xAA #xEE #xAA))
(define-colour error-colour    '(#xEE #xAA #xAA))
(define-colour document-colour '(#xEE #xEE #xAA))
(define-colour binary-colour   '(#xAA #xEE #xEE))
(define-colour image-colour    '(#xEE #xAA #xEE))
(define-colour clicked-colour  '(#xAA #xAA #xAA))
