;;; ~/.doom.d/autoload.el -*- lexical-binding: t; -*-

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
