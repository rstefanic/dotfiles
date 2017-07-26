(add-to-list 'load-path "~/.emacs.d/custom-html-rows.el")

(add-to-list 'load-path' "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'cl-lib)
;; Move Backup Directory to temp file directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Add the column number next to the row number
(setq column-number-mode t)

;; Remove Lockfiles
(setq create-lockfiles nil) 

;; remove  toolbar
(tool-bar-mode -1)

;; remove menu bar
(menu-bar-mode -1)

;; remove scrollbar
(tool-bar-mode -1
)
;; Move Temp Files
(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
(setq backup-directory-alist
    `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
    `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
    emacs-tmp-dir)


(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list
   'package-archives
   '("melpa" . "http://stable.melpa.org/packages/")
   t))

(defvar prelude-packages
  '(haskell-mode)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(if (version<= "24.0" emacs-version)
    (unless (prelude-packages-installed-p)
      ;; check for new packages (package versions)
      (message "%s" "Emacs Prelude is now refreshing its package database...")
      (package-refresh-contents)
      (message "%s" " done.")
      ;; install the missing packages
      (dolist (p prelude-packages)
        (when (not (package-installed-p p))
          (package-install p)))))

;; Haskell
(defun my-haskell-hook ()
  (progn
    (interactive-haskell-mode)
    (haskell-doc-mode)
    (haskell-indentation-mode)
))

(add-hook 'haskell-mode-hook 'my-haskell-hook)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(blink-cursor-mode nil)
 '(cursor-type (quote box))
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
   (quote
    ("bd17fab82168d7eee21b600f1bb9b09de34270478a9008f6b5436803c4d61d3d" "d787eeb34329786bf55dbaf98e20cdfcef01fb88c6592ae17f53ecba122948a7" default)))
 '(display-battery-mode t)
 '(haskell-tags-on-save t)
 '(ido-mode (quote both) nil (ido))
 '(nyan-mode t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages (quote (ghc haskell-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



(require 'package)
(add-to-list 'package-archives
  '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; Linux Machines
(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

;; Windows Machines
;; (let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
;;  (setenv "PATH" (concat my-cabal-path ";" (getenv "PATH")))
;;  (add-to-list 'exec-path my-cabal-path))
;; (let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
;;  (setenv "PATH" (concat my-cabal-path ";" (getenv "PATH")))
;;  (add-to-list 'exec-path my-cabal-path))

(put 'scroll-left 'disabled nil)
