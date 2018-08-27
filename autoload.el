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

;;;###autoload
(defun ivy-posframe-display-at-lower-center (info)
  (let ((parent-frame (plist-get info :parent-frame))
        (pos (posframe-poshandler-frame-center info)))
    (cons (car pos)
          (truncate (/ (frame-pixel-height parent-frame) 2)))))


;;;###autoload
(defun ivy-posframe-display-at-lower-center (str)
  (ivy-posframe--display str #'ivy-posframe-display-at-lower-center)
  (ivy-posframe-enable))

