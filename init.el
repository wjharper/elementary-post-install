;;This is a comment


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#ffffff" "#ff9da4" "#d1f1a9" "#ffeead" "#bbdaff" "#ebbbff" "#99ffff" "#002451"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes (quote ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" default)))
 '(fci-rule-color "#00346e")
 '(inhibit-startup-screen t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#ff9da4") (40 . "#ffc58f") (60 . "#ffeead") (80 . "#d1f1a9") (100 . "#99ffff") (120 . "#bbdaff") (140 . "#ebbbff") (160 . "#ff9da4") (180 . "#ffc58f") (200 . "#ffeead") (220 . "#d1f1a9") (240 . "#99ffff") (260 . "#bbdaff") (280 . "#ebbbff") (300 . "#ff9da4") (320 . "#ffc58f") (340 . "#ffeead") (360 . "#d1f1a9"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Add ~/.emacs.d to load-path
(add-to-list 'load-path "~/.emacs.d")
; Use wombat theme
;;(require 'color-theme)

;;(load-file "~/.emacs.d/color-theme-wombat.el")
;;(color-theme-wombat)
;; Auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)
;;Get rid of tool and menu bars
(tool-bar-mode -1)
(menu-bar-mode -1)
;;New package repo for tommorrow
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;Color-themes
;;(load-file (expand-file-name "~/.emacs.d/elpa/color-theme-wombat+-0.0.2/color-theme-wombat+.el"))
;;(load-file (expand-file-name "~/.emacs.d/elpa/zenburn-theme-20130914.1044/zenburn-theme.el"))
;;(load-file (expand-file-name "~/.emacs.d/elpa/color-theme-wombat-0.0.1/color-theme-wombat.el"))
;;(load-file (expand-file-name "~/.emacs.d/elpa/color-theme-github-0.0.3/color-theme-github.el"))
;;(color-theme-monokai)
;;(color-theme-wombat+)
;;(color-theme-solarized-light)


;;Start fullscreen
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(if window-system(toggle-fullscreen))

;;Status bar/mode line 
;;(setq-default mode-line-format nil)

;;Line numbering
(global-linum-mode 1)

;;Remove Scroll bar
(set-scroll-bar-mode nil)

;;Set font size
(set-face-attribute 'default nil :height 100)

;; Set Indention Policy
(setq-default c-indent-tabs-mode t     ; Pressing TAB should cause indentation
                c-indent-level 4         ; A TAB is equivilent to four spaces
                c-argdecl-indent 0       ; Do not indent argument decl's extra
                c-tab-always-indent t
                backward-delete-function nil) ; DO NOT expand tabs when deleting
  (c-add-style "my-c-style" '((c-continued-statement-offset 4))) ; If a statement continues on the next line, indent the continuation by 4
  (defun my-c-mode-hook ()
    (c-set-style "my-c-style")
    (c-set-offset 'substatement-open '0) ; brackets should be at same indentation level as the statements they open
    (c-set-offset 'inline-open '+)
    (c-set-offset 'block-open '+)
    (c-set-offset 'brace-list-open '+)   ; all "opens" should be indented by the c-indent-level
    (c-set-offset 'case-label '+))       ; indent case labels by c-indent-level, too
  (add-hook 'c-mode-hook 'my-c-mode-hook)
  (add-hook 'c++-mode-hook 'my-c-mode-hook)

;;PHP MODE
(load-file (expand-file-name "~/.emacs.d/php-mode-improved.el"))
(require 'php-mode)

;; ;;Taureg Mode (Ocaml)
;; (add-to-list 'load-path "~/.emacs.d/tuareg-2.0.6")
;; (setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
;; (autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
;; (autoload 'camldebug "camldebug" "Run the Caml debugger" t) 
;; (autoload 'tuareg-pkg "tuareg-pkg" "pkg tuareg" t)
;; ;; Indent `=' like a standard keyword.
;; (setq tuareg-lazy-= t)
;; ;; Indent [({ like standard keywords.
;; (setq tuareg-lazy-paren t)
;; ;; No indentation after `in' keywords.
;; (setq tuareg-in-indent 0)

;; (add-hook 'tuareg-mode-hook
;; 	  ;; Turn on auto-fill minor mode.
;; 	  (lambda () (auto-fill-mode 1)))
;; (put 'narrow-to-region 'disabled nil)
