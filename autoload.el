;;;###autoload
(defun newline-without-break-of-line ()
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (doom*newline-and-indent 3)
    (previous-line)))

;;;###autoload
(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))