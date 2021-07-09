;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(require 'eslint-fix)

(eval-after-load 'js2-mode
		 '(add-hook 'js2-mode-hook (lambda () (add-hook 'after-save-hook 'eslint-fix nil t))))

(require 'cc-mode)
(global-company-mode)
;(electric-pair-mode t)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-clang-executable "/usr/bin/clang")
;(setq company-backends (delete 'company-semantic company-backends))
;(electric-pair-mode t)
;(define-key c-mode-base-map  [(tab "SPC")] 'company-complete)
;(define-key c++-mode-map  [(tab "SPC")] 'company-complete)
;(global-set-key (kbd "<tab>") #'proced)
(global-set-key (kbd "TAB") #'indent-for-tab-command)

(setq-default c-basic-offset 2)

(use-package-hook! lsp-mode
		   :post-config
		   (setq lsp-enable-on-type-formatting nil))

(custom-set-variables
  '(c-basic-offset 2))


(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-changedir)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

;(global-set-key (kbd "r") #'neotree-refresh)

(add-to-list 'company-backends 'company-c-headers)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq c-basic-offset 2)


(c-add-style
  "my-c-common-style"
  '("k&r"
    ;;    (setq tab-width 3
    ;; make sure spaces are used instead of tabs
    ;;            indent-tabs-mode nil)
    (c-basic-offset . 2)
    ))

(setq c++-tab-always-indent t)

(global-set-key (kbd "<M-left>") 'windmove-left)
(global-set-key (kbd "<M-right>") 'windmove-right)
(global-set-key (kbd "<M-up>") 'windmove-up)
(global-set-key (kbd "<M-down>") 'windmove-down)

(setq neo-window-width 32)

;;; runs eslint --fix on the current file after save
;;; alpha quality -- use at your own risk

;(defun eslint-fix-file ()
;  (interactive)
;  (message "eslint --fixing the file" (buffer-file-name))
;  (shell-command (concat "eslint --fix " (buffer-file-name))))
;
;(defun eslint-fix-file-and-revert ()
;  (interactive)
;  (eslint-fix-file)
;  (revert-buffer t t))
;
;(add-hook 'js2-mode-hook
;	  (lambda ()
;	    (add-hook 'after-save-hook #'eslint-fix-file-and-revert)))
;
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Sebastian Karlsson"
      user-mail-address "ianertson@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
