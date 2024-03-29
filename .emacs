(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
 
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; ***************************** EMACS CONFIG ********************************************
;; set the font sizs
(set-face-attribute 'default nil :family "Monaco")
;; default font size (point * 10)
;;
;; WARNING!  Depending on the default font,
;; if the size is not supported very well, the frame will be clipped
;; so that the beginning of the buffer may not be visible correctly. 
(set-face-attribute 'default nil :height 165)

;; use specific font for Korean charset.
;; if you want to use different font size for specific charset,
;; add :size POINT-SIZE in the font-spec.
(set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))


;; set eshell colors
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'eshell-preoutput-filter-functions
           'ansi-color-filter-apply)
      
;; hide welcome screens in emacs
(setq inhibit-startup-screen t)

;; use emacs in full screen mode always
(set-frame-parameter nil 'fullscreen 'fullboth)

;; start emacs in a default directory
;; (setq default-directory "~/Documents/notes/vmarni/")
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)

;; open default file in emacs
;; (setq initial-buffer-choice "/Users/vmarni/Documents/notes/vmarni/ana-app.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (gnuplot-mode gnuplot flx-ido projectile groovy-mode htmlize eimp anaconda-mode sphinx-doc undo-tree zenburn-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Does anyone type yes anymore? variable settings for yes and no
(fset 'yes-or-no-p 'y-or-n-p)

;; text wraping: wrap lines at word boundary
(global-visual-line-mode 1)

;; enable line numbers globally
(global-linum-mode t) 

;; ***************************** ORG MODE CONFIG ********************************************
;; (require 'org)
;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)
;; (setq org-log-done t)

;; TODO customization
(use-package org
  :pin melpa-stable
  :init
  (setq org-startup-indented t)
  (setq org-log-into-drawer "LOGBOOK")
  (setq org-todo-keywords
        '((sequence "TODO(t)"
                    "IN-PROGRESS(i)"
                    "BLOCKED(b@)"
                    "|"
                    "DONE(d!)"
                    "DELEGATED(g@)"
                    "CANCELED(c)")))

(setq-default org-catch-invisible-edits 'smart))

;; adding and loading themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;; setting org-agenda-files
;; (setq org-agenda-files (list "~/Documents/notes/vmarni/ana-app.org" "~/Documents/notes/vmarni/daily-logs.org"))

;; clocking config
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; image settings
;; use the below line to show all the images. you can use C-c C-x C-v to toggle the image
;; (setq org-startup-with-inline-images t)
;; use below 2 lines to set all the images dimensions to deafult to 400
;; (setq org-image-actual-width nil)
;; (setq org-image-actual-width 400)

;; plotting in org-mode using org-plot shortcut
(local-set-key "\M-\C-g" 'org-plot/gnuplot)

;; projectile for managing projects
(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)
(setq projectile-project-search-path '("~/PycharmProjects/" "~/Documents/notes/vmarni/"))
