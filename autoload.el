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
(defun ivy-poshandler-display-at-lower-center (info)
  (cons (/ (- (plist-get info :parent-frame-width)
              (plist-get info :posframe-width))
           2)
        (/ (- (plist-get info :parent-frame-height)
              (plist-get info :posframe-height))
           3)))


;;;###autoload
(defun ivy-posframe-display-at-lower-center (str)
  (ivy-posframe--display str #'ivy-poshandler-display-at-lower-center)
  (ivy-posframe-enable))

