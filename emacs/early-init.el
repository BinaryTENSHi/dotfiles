;;; package --- Yuu's Emacs early configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Disable package.el for elpaca
(setq package-enable-at-startup nil)

;; Basic frame settings
(setq frame-resize-pixelwise t
      frame-inhibit-implied-resize 'force
      frame-title-format '("%b")
      ring-bell-function 'ignore
      use-dialog-box t
      use-file-dialog nil
      use-short-answers t
      inhibit-splash-screen t
      inhibit-startup-screen t
      inhibit-x-resources t
      inhibit-startup-echo-area-message user-login-name
      inhibit-startup-buffer-menu t)

;; Disable UI elements
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;;; early-init.el ends here
