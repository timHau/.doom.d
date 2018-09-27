;;;###autoload
(defun newline-without-break-of-line ()
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (newline-and-indent)
    (previous-line)))

;;;###autoload
(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

