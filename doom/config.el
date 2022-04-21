;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Font
(setq doom-font (font-spec :family "JetBrains Mono" :size 12))

;; Theme
(setq doom-theme 'doom-dracula)

;; Set default work path
(setq projectile-project-search-path '("~/work"))

;; Do not create an anonymous session #n when launching emacsclient
(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override "main"))

;; Org agenda
(setq org-agenda-files '("~/org/inbox.org"
                         "~/org/tasks.org"
                         "~/org/timed.org"))

;; Open org files
(defun binary/open-inbox ()
  "Opens the default org inbox file"
  (interactive)
  (find-file "~/org/inbox.org"))

(defun binary/open-tasks ()
  "Opens the default org tasks file"
  (interactive)
  (find-file "~/org/tasks.org"))

(map! :n "SPC o i" #'binary/open-inbox
      :n "SPC o t" #'binary/open-tasks)

(after! org
  ;; Org keywords
  (setq org-todo-keywords '((sequence "TODO(t)" "RUNNING(r)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

  ;; Org capture templates
  (setq org-capture-templates '(
                                ;; Create a quick new inbox item
                                ("i" "Todo [inbox]" entry
                                 (file "~/org/inbox.org")
                                 "* TODO %i%?")

                                ;; Create a private todo
                                ("p" "Private [todo]" entry
                                 (file+headline "~/org/tasks.org" "Private")
                                 "* TODO %i%? :private:")

                                ;; Create a private timed entry
                                ("P" "Private [timed]" entry
                                 (file+headline "~/org/timed.org" "Private")
                                 "* %i%? :private: \n %U")

                                ;; Create a work todo
                                ("w" "Work [todo]" entry
                                 (file+headline "~/org/tasks.org" "Work")
                                 "* TODO %i%? :work:")

                                ;; Create a work timed entry
                                ("W" "Work [timed]" entry
                                 (file+headline "~/org/timed.org" "Work")
                                 "* %i%? :work: \n %U")))

  ;; Org refile targets
  (setq org-refile-targets '(("~/org/tasks.org" :maxlevel . 3)
                             ("~/org/someday.org" :level . 1)
                             ("~/org/timed.org" :maxlevel . 2)))

  ;; Start the week on Monday
  (setq org-agenda-start-on-weekday 1)
  (setq calendar-week-start-day 1)

  ;; Org custom command
  (setq org-agenda-custom-commands
        '(("w" "At work" tags-todo "work"
           ((org-agenda-overriding-header "Work")))

          ("p" "Private" tags-todo "private"
           ((org-agenda-overriding-header "Private")))))
)
