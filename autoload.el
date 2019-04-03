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

;;;###autoload
(defun indent-whole-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

;;;###autoload
(defun multi-previous-line ()
  (interactive)
  (next-line -5))

;;;###autoload
(defun multi-next-line ()
  (interactive)
  (next-line 5))

;;;###autoload
(defun rust-println-thing-at-point ()
  (interactive)
  (let ((current-word (thing-at-point 'word)))
    (evil-forward-paragraph)
    (insert (format "println!(\"%s: {}\", %s);" current-word current-word))
    (rust-mode-indent-line)
    (left-word)
    (left-char 4)))
