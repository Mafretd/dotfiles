(setq custom-file "/home/mafretd/.emacs.d/emacs.custom.el")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.
;; See `package-archive-priorities` and `package-pinned-packages`.
;; Most users will not need or want to do this.
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

;; Ido
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;;Deleted files to trash
(setq delete-by-moving-to-trash t)

(set-face-attribute 'default nil
		    :family "Google Sans Code"
		    :height 150
		    :weight 'light
		    )

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq column-number-mode t)

(setq ring-bell-function 'ignore)

(require-theme 'modus-themes)

(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t)

(setq modus-vivendi-tinted-palette-overrides
      `(
	(fg-main "#cccccc")
	(fg-mode-line-active "#cccccc")
	(fg-line-number-active "#cccccc")
	(date-now "#cccccc")
	(fg-heading-1 "#cccccc")
	,@modus-themes-preset-overrides-faint))

(load-theme 'modus-vivendi-tinted :no-confirm)

(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)
(setq save-iterprogram-paste-before-kill t)

(global-hl-line-mode 1)

;; Maximize Emacs frame at startup
(add-hook 'emacs-startup-hook
          (lambda ()
          (set-frame-parameter nil 'undecorated t)  ;; Remove window decorations
            (set-frame-parameter nil 'fullscreen 'maximized))) ;; Maximize window
  
           

;; smex
(global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Backups and autosaves
(let ((backup-dir "~/.tmp/emacs/backups/")
      (auto-saves-dir "~/.tmp/emacs/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
        auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t    ;; Don't delink hardlinks
      delete-old-versions t  ;; Clean up the backups
      version-control t      ;; Use version numbers on backups,
      kept-new-versions 5    ;; keep some new versions
      kept-old-versions 2)   ;; and some old ones, too

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(add-hook 'org-mode-hook 'org-indent-mode)
(put 'downcase-region 'disabled nil)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay nil)
(global-set-key (kbd "C-c C-SPC") 'company-complete)

;; yasnippets
(yas-global-mode 1)

;; multiple cursors
(require 'multiple-cursors)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(put 'upcase-region 'disabled nil)

;; move-text
(require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

(load-file custom-file)
