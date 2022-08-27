;;; yuck-mode.el --- Major mode for the yuck configuration language -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 mmcjimsey26
;;
;; Author: mmcjimsey26
;; Maintainer: mmcjimsey26
;; Created: June 14, 2022
;; Modified: July 3, 2022
;; Version: 1.0.1
;; Keywords: languages yuck eww widgets
;; Homepage: https://github.com/mmcjimsey26/yuck-mode
;; Package-Requires: ((emacs "25.1"))
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;; A simple major mode for editing files in the yuck configuration language, used for
;; configuring ElKowar's Wacky Widgets (eww), usually ending in `.yuck'.

;; This package provides the following features:
;;      * Syntax hilighting

;;; Installation:

;; This mode requires Emacs-25.1 or higher.
;; Put this file into `load-path' and the following into ~/.emacs
;;      (autoload 'yuck-mode "yuck-mode" nil t)

;;; Code:

(defgroup yuck nil
  "Yuck Configuration Major Mode."
  :group 'languages)

(defconst yuck-mode-menu nil "Menu for yuck mode.")

(defvar yuck-mode-hook nil "Yuck mode hook.")

;; Keywords and widget types for `yuck-mode'.
(defvar yuck-keywords-list
  '("defvar" "defpoll" "deflisten" "defwindow" "defwidget" "for" "include"))

(defvar yuck-widgets-list
  '("combo-box-text"
    "expander" "revealer" "checkbox" "color-button" "color-chooser" "scale" "progress"
    "input" "button" "image" "box" "overlay" "centerbox" "scroll" "eventbox"
    "label" "literal" "calendar" "transform" "circular-progress" "graph"))

(defvar yuck-keywords-regex)
(defvar yuck-widgets-regex)
(defvar yuck-font-lock-keywords)

;; Regex to highlight buffer.
(setq yuck-keywords-regex (regexp-opt yuck-keywords-list 'words))
(setq yuck-widgets-regex (regexp-opt yuck-widgets-list 'words))

(setq yuck-font-lock-keywords
  `(
    (,yuck-keywords-regex . font-lock-keyword-face)
    (,yuck-widgets-regex . font-lock-type-face)
    ("\:[a-z\-]*" . font-lock-builtin-face)))

(defconst yuck-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; "" : string delimiter
    (modify-syntax-entry ?\" "\"" table)
    (modify-syntax-entry ?\` "\"" table)
    (modify-syntax-entry ?\; "<" table)
    (modify-syntax-entry ?\n ">" table)
    table))

;;;###autoload
(define-derived-mode yuck-mode prog-mode "Yuck"
  "Major mode for editing yuck config files."
  :syntax-table yuck-mode-syntax-table
  (setq font-lock-defaults '(yuck-font-lock-keywords))
  (font-lock-ensure))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.yuck\\'" . yuck-mode))

(provide 'yuck-mode)
;;; yuck-mode.el ends here
