;;Modified Code from Aleix's Blog http://hacks-galore.org/aleix/blog/archives/2013/01/08/install-emacs-packages-from-command-line

;;Install package from command line.
;;Command line command:
;;--batch --eval "(defconst pkg-to-install yourPackageName)" -l emacs-pkg-install.el

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)
(package-refresh-contents)
(package-install pkg-to-install)

