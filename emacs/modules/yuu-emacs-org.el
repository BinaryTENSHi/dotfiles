;;; package --- org-mode configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defun yuu/org-directory ()
  "Return the org directory depending on the system."
  (concat
   (getenv "HOME")
   (pcase system-type
     ('gnu/linux "/OneDrive/Notes")
     ('darwin "/OneDrive - Binary Network/Notes")
     (_ (error (format "Unconfigured system-type: %s" system-type))))))

(use-package org
  :ensure t
  :custom
  (org-directory (yuu/org-directory))
  :hook
  ;; Indent org headings
  (org-mode . org-indent-mode))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (yuu/org-directory))
  :config

  ;; Enforce generated uuids to be lowercase:
  ;; `uuidgen` ond macOS returns uppercase.
  (define-advice org-id-new
      (:filter-return (uuid) yuu/org-id-new-lowercase)
    "Lowercases the generated uuid to be consistent over all platforms."
    (if (eq org-id-method 'uuid)
	(downcase uuid)
      uuid))

  ;; Keybinds
  (yuu/leader
    "n" '(:ignore t :wk "Notes")

    ;; Goto regular notes
    "n r f" '(org-roam-node-find :wk "Find node")

    ;; Goto daily notes
    "n r d d" '(org-roam-dailies-goto-date :wk "Goto date")

    "n r d y" '(org-roam-dailies-goto-yesterday :wk "Goto yesterday")
    "n r d Y" '(org-roam-dailies-capture-yesterday :wk "Capture yesterday")

    "n r d t" '(org-roam-dailies-goto-today :wk "Goto today")
    "n r d T" '(org-roam-dailies-capture-today :wk "Capture today")

    "n r d m" '(org-roam-dailies-goto-tomorrow :wk "Goto tomorrow")
    "n r d M" '(org-roam-dailies-capture-tomorrow :wk "Capture tomorrow")))

(provide 'yuu-emacs-org)
;;; yuu-emacs-org.el ends here
