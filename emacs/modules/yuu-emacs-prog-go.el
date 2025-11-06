;;; package --- Programming: Go -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defun yuu/gcl-flymake--match-regex (filename)
  "Return the golangci-lint regex for matching an issue.
FILENAME is the name of the file to match against."
  (format "\\(%s\\):\\([0-9]+\\):\\([0-9]+\\): \\(.*\\) \\(([A-z0-9]+)\\)"
          filename))

(require 'cl-lib)
(defvar-local golangci--flymake-proc nil)
(defun yuu/gcl-flymake (report-fn &rest _args)
  "Run the golangci-lint checker.
REPORT-FN is the callback to send all diagnostics back to flymake."
  (unless (executable-find "golangci-lint")
    (error "Unable to find golangci-lint"))

  ;; If an earlier check was found, kill that process.
  ;; Its sentinel will notice its obsoletion.
  (when (process-live-p golangci--flymake-proc)
    (kill-process golangci--flymake-proc))

  (let* ((source (current-buffer))
	 (match-regexp (yuu/gcl-flymake--match-regex
			(file-name-nondirectory (buffer-file-name source)))))
    (save-restriction
      (widen)

      (setq golangci--flymake-proc
	    (make-process
	     :name "golangci-lint" :noquery t :connection-type 'pipe
	     ;; Output to a temporary buffer
	     :buffer (generate-new-buffer " *golangci-lint*")
	     ;; Command to run
	     :command `("golangci-lint" "run" ,(file-name-directory (buffer-file-name source)))
	     :sentinel
	     (lambda (proc _event)
	       ;; Check that the process has exited.
	       ;; It may be simply suspended...
	       (when (memq (process-status proc) '(exit signal))
		 (unwind-protect
		     ;; Only proceed if `proc' is the same as
		     ;; `golangci--flymake-proc', which indicates it
		     ;; is the current instance.
		     (if (with-current-buffer source (eq proc golangci--flymake-proc))
			 (with-current-buffer (process-buffer proc)
			   (goto-char (point-min))
			   ;; Loop through the output
			   (cl-loop
			    while (search-forward-regexp
				   match-regexp
				   nil t)

			    for msg = (format "golangci-lint %s: %s"
					      (match-string 5)
					      (match-string 4))
			    for (beg . end) = (flymake-diag-region
					       source
					       (string-to-number (match-string 2))
					       (string-to-number (match-string 3)))

			    when (and beg end)
			    collect (flymake-make-diagnostic source
							     beg
							     end
							     :error
							     msg)
			    into diags
			    finally (funcall report-fn diags)))

		       (flymake-log :warning "Canceling obsolete check %s"
				    proc))
		   ;; Cleanup the temporary buffer
		   (kill-buffer (process-buffer proc))))))))))

(defun yuu/golangci-lint-setup-flymake-backend ()
  "Setup the golangci-lint flymake backend."
  (add-hook 'flymake-diagnostic-functions 'yuu/gcl-flymake nil t))

(use-package go-mode
  :ensure t
  :after (eglot)
  :hook
  (go-ts-mode . eglot-ensure)
  ;; Automatically add the hook as eglot overrides the flymake hooks
  (eglot-managed-mode . yuu/golangci-lint-setup-flymake-backend))

(provide 'yuu-emacs-prog-go)
;;; yuu-emacs-prog-go.el ends here
