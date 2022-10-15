(load "~/.emacs.d/init-packages")
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-term-color-vector
   [unspecified "#272822" "#f92672" "#a6e22e" "#f4bf75" "#66d9ef" "#ae81ff" "#66d9ef" "#f8f8f2"])
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(org-agenda-files
   (quote
   #TODO: read dynamically from text files org files to agenda
    ())
 '(package-selected-packages (quote (ess base16-theme ox-mediawiki ox-gfm evil))))
;; no menu bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

; (require 'package)
; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
; (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
;(package-initialize)

(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)

;; to enable line numbers in different modes
(add-hook 'prog-mode-hook 'linum-mode) 
(add-hook 'dired-mode-hook 'linum-mode)
(add-hook 'org-mode-hook 'linum-mode)

;; org-mode stuff
;; The following lines are always needed. Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
(setq org-todo-keywords
      '((sequence "TODO(t)" "WIP(i)" "|" "DONE(d)" "WAITING(w)" "CANCELED(c)")))
(setq org-log-done 'time)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)


;;(setq org-latex-create-formula-image-program 'imagemagick)
;; Highlight code in code blocks in native language, also use TAB as
;; in native language.
(setq org-src-fontify-natively t
      org-src-tab-acts-natively t)

;; Change font size for LaTeX previews.
(setq org-format-latex-options
      (plist-put org-format-latex-options :scale 1.5))
(setq org-format-latex-options
      (plist-put org-format-latex-options :html-scale 1.5)) 

;; add ox-gfm
(eval-after-load "org"
  '(require 'ox-gfm nil t))
(eval-after-load "org"
  '(require 'ox-mediawiki nil t))


(setq org-time-clocksum-format (quote (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
;;(setq org-duration-format (quote h:mm))

;; add logbook drawer
(setq org-log-into-drawer t)
(setq org-clock-into-drawer t)

;; wrap text after 80 characters
(add-hook 'text-mode-hook 'auto-fill-mode)
(setq-default fill-column 80)

(setq inhibit-splash-screen t)         ; hide welcome screen

;; Highlight current line in agenda.
(add-hook 'org-agenda-mode-hook (lambda () (hl-line-mode 1)))

;; Better calendar settings: Include last week only if today is
;; Monday, always show three weeks. and always start the week on
;; Monday.
;; (setq calendar-week-start-day 0
;;       org-agenda-start-on-weekday t
;;       org-agenda-start-day "-1d")
;;       org-agenda-span 21
;;       org-agenda-include-diary t

;; (setq url-proxy-services '(("http" . "cloudproxy.dhl.com:10123")
;;                             ("https" . "cloudproxy.dhl.com:10123")) 
;; Org-agenda Vim Keybindings
;; based on https://gist.github.com/amirrajan/301e74dc844a4c9ffc3830dc4268f177

(eval-after-load 'org-agenda
 '(progn
    (evil-set-initial-state 'org-agenda-mode 'normal)
    (evil-define-key 'normal org-agenda-mode-map
      (kbd "<RET>") 'org-agenda-switch-to
      (kbd "\t") 'org-agenda-goto

      "q" 'org-agenda-quit
      "r" 'org-agenda-redo
      "S" 'org-save-all-org-buffers
      "gj" 'org-agenda-goto-date
      "gJ" 'org-agenda-clock-goto
      "gm" 'org-agenda-bulk-mark
      "go" 'org-agenda-open-link
      "s" 'org-agenda-schedule
      "+" 'org-agenda-priority-up
      "," 'org-agenda-priority
      "-" 'org-agenda-priority-down
      "y" 'org-agenda-todo-yesterday
      "n" 'org-agenda-add-note
      "t" 'org-agenda-todo
      ":" 'org-agenda-set-tags
      ";" 'org-timer-set-timer
      "I" 'helm-org-task-file-headings
      "i" 'org-agenda-clock-in-avy
      "O" 'org-agenda-clock-out-avy
      "u" 'org-agenda-bulk-unmark
      "x" 'org-agenda-exit
      "j"  'org-agenda-next-line
      "k"  'org-agenda-previous-line
      "vt" 'org-agenda-toggle-time-grid
      "va" 'org-agenda-archives-mode
      "vw" 'org-agenda-week-view
      "vl" 'org-agenda-log-mode
      "vd" 'org-agenda-day-view
      "vc" 'org-agenda-show-clocking-issues
      "g/" 'org-agenda-filter-by-tag
      "o" 'delete-other-windows
      "gh" 'org-agenda-holiday
      "gv" 'org-agenda-view-mode-dispatch
      "f" 'org-agenda-later
      "b" 'org-agenda-earlier
      "c" 'helm-org-capture-templates
      "e" 'org-agenda-set-effort
      "n" nil  ; evil-search-next
      "{" 'org-agenda-manipulate-query-add-re
      "}" 'org-agenda-manipulate-query-subtract-re
      "A" 'org-agenda-toggle-archive-tag
      "." 'org-agenda-goto-today
      "0" 'evil-digit-argument-or-evil-beginning-of-line
      "<" 'org-agenda-filter-by-category
      ">" 'org-agenda-date-prompt
      "F" 'org-agenda-follow-mode
      "D" 'org-agenda-deadline
      "H" 'org-agenda-holidays
      "J" 'org-agenda-next-date-line
      "K" 'org-agenda-previous-date-line
      "L" 'org-agenda-recenter
      "P" 'org-agenda-show-priority
      "R" 'org-agenda-clockreport-mode
      "Z" 'org-agenda-sunrise-sunset
      "T" 'org-agenda-show-tags
      "X" 'org-agenda-clock-cancel
      "[" 'org-agenda-manipulate-query-add
      "g\\" 'org-agenda-filter-by-tag-refine
      "]" 'org-agenda-manipulate-query-subtract)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load "ess-autoloads")

;; Always space after comma.
(setq ess-R-smart-operators nil)

;; Don't restore history and don't save history.
(setq inferior-R-args "--no-restore-history --no-save")

;; Start R in the working directory by default.
(setq ess-ask-for-ess-directory nil)

;; ESS will not print the evaluated commands, also speeds up the
;; evaluation.
;; (setq ess-eval-visibly nil)

;; Major mode font-lock.
(setq ess-R-font-lock-keywords
      '((ess-R-fl-keyword:modifiers . t)
        (ess-R-fl-keyword:fun-defs . t)
        (ess-R-fl-keyword:keywords . t)
        (ess-R-fl-keyword:assign-ops)
        (ess-R-fl-keyword:constants . t)
        (ess-fl-keyword:fun-calls . t)
        (ess-fl-keyword:numbers .t )
        (ess-fl-keyword:operators . t)
        (ess-fl-keyword:delimiters . t)
        (ess-fl-keyword:= . t)
        (ess-R-fl-keyword:F&T . t)
        (ess-R-fl-keyword:%op% . nil)))

;; Inferior mode font-lock.
(setq inferior-R-font-lock-keywords
      '((ess-R-fl-keyword:modifiers . t)
        (ess-R-fl-keyword:fun-defs . t)
        (ess-R-fl-keyword:keywords . t)
        (ess-R-fl-keyword:assign-ops)
        (ess-R-fl-keyword:constants . t)
        (ess-fl-keyword:fun-calls . t)
        (ess-fl-keyword:numbers . t)
        (ess-fl-keyword:operators . t)
        (ess-fl-keyword:delimiters . t)
        (ess-fl-keyword:= . t)
        (ess-R-fl-keyword:F&T . t)
        (ess-R-fl-keyword:%op% . nil))) 
