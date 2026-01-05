;;; package --- Keybinding configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Setup General.el
(defun yuu/load-user-init-file ()
  "Load the init.el file."
  (interactive)
  (load-file user-init-file))

(use-package general
  :ensure t
  :config
  (general-evil-setup)

  (general-create-definer yuu/leader
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "M-SPC")

  ;; Buffer management
  (yuu/leader
    "b" '(:ignore t :wk "Buffer")
    "b s" '(save-buffer :wk "Save buffer")
    "b b" '(consult-buffer :wk "Switch buffer")
    "b k" '(kill-current-buffer :wk "Kill current buffer")
    "b r" '(revert-buffer :wk "Revert buffer"))

  ;; Help management
  (yuu/leader
    "h" '(:ignore t :wk "Help")
    "h f" '(describe-function :wk "Describe function")
    "h v" '(describe-variable :wk "Describe variable")
    "h r" '(yuu/load-user-init-file :wk "Load init.el"))

  ;; Project management
  (yuu/leader
    "SPC" '(project-find-file :wk "Project find file")
    "/" '(consult-ripgrep :wk "Project ripgrep")

    "p" '(:ignore t :wk "Project")
    "p p" '(project-switch-project :wk "Switch project")
    "p b" '(project-switch-to-buffer :wk "Switch project buffer")
    "p c" '(project-compile :wk "Project compile")
    "p C" '(project-recompile :wk "Project recompile"))

  ;; Package management
  (yuu/leader
    "P" '(:ignore t :wk "Packages")
    "P U" '(elpaca-update-all :wk "Elpaca update all")
    "P l" '(elpaca-log :wk "Elpaca log")))

(provide 'yuu-emacs-keybinds)
;;; yuu-emacs-keybinds.el ends here
