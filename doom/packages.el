;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; Theme
(package! catppuccin-theme)
;; LanguageTool integration
(package! lsp-ltex)

;; Disable ccls to force clangd
(package! ccls :disable t)
