;;;###autoload
(defun +private-newline-without-break-of-line ()
  (interactive)
  (let ((oldpos (point)))
    (beginning-of-line)
    (doom*newline-and-indent 3)
    (previous-line)))

;;;###autoload
(defun +private-switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;;;###autoload
(defun +private-ivy-display-at-frame-center-near-bottom (str)
  (interactive)
  (ivy-posframe--display str #'+ivy-poshandler-frame-center-near-bottom))

;;;###autoload
(defun +private-ivy-poshandler-frame-center-near-bottom (info)
  (let ((parent-frame (plist-get info :parent-frame))
        (pos (posframe-poshandler-frame-center info)))
    (cons (car pos)
          (truncate (/ (frame-pixel-height parent-frame) 3)))))
