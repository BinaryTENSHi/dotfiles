;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Font
;; Specifying JetBrains Mono as the font messes up the bottom part of an emacsclient. Why? I don't know.
;;(setq doom-font (font-spec :family "JetBrainsMono" :size 10.0))

;; Set default work path
(setq projectile-project-search-path '("~/work"))

;; Do not create an anonymous session #n when launching emacsclient
(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override "main"))
