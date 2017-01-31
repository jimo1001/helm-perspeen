;;; helm-perspeen.el --- helm extension for perspeen.el
;; Copyright (C) 2017 jimo1001 <jimo1001@gmail.com>
;;
;; Author: Yoshinobu Fujimoto
;; URL:https://github.com/jimo1001/helm-perspeen
;; Created: 2017-01-30
;; Version: 0.1.0
;; Keywords: projects, lisp
;; Package0Requires: (("emacs" "25.0") ("perspeen" "0.1.0"))

;;  URLs
;;  - perspeen
;;     - https://github.com/seudut/perspeen/blob/master/perspeen
;;  - helm:
;;    - https://emacs-helm.github.io/helm/
;;  - helm-projectile
;;    - https://github.com/bbatsov/helm-projectile
;;

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;

;;; Commentary:

;; This package provides helm interface for perspeen's workspaces.

;;; Code:

(require 'helm)
(require 'perspeen)
(require 'helm-projectile)

(defvar helm-source-perspeen
  (helm-build-sync-source "WorkSpaces (perspeen)"
    :candidates
    (lambda ()
      (let ((index 0))
        (mapcar (lambda (ws)
                  (setq index (+ index 1))
                  (list (format "%s (%s)" (elt ws 1) (elt ws 5)) index))
                perspeen-ws-list)))
    :action
    (lambda (index)
      (apply 'perspeen-goto-ws index)))
  "The workspaces helm source for perspeen.el.")

(defun helm-perspeen-create-projectile-workspace (dir)
  "Create new workspace with project directory.
DIR is project root directory."
  (interactive)
  (perspeen-create-ws)
  (perspeen-change-root-dir dir))

(defvar helm-source-create-workspace
  (helm-build-dummy-source
      "Create perspeen workspace"
    :action (helm-make-actions
             "Create Workspace (perspeen)"
             (lambda (candidate)
               (perspeen-create-ws)
               (perspeen-rename-ws candidate) nil))))

;;;###autoload
(eval-after-load 'helm-projectile
  #'(lambda ()
      (setq helm-source-projectile-projects-actions
            (append helm-source-projectile-projects-actions
                    '(("Create WorkSpace (perspeen)" . helm-perspeen-create-projectile-workspace))))))

;;;###autoload
(defun helm-perspeen ()
  "Display workspaces (perspeen.el) with helm interface."
  (interactive
   (helm '(helm-source-perspeen helm-source-create-workspace))))

(provide 'helm-perspeen)

;;; helm-perspeen.el ends here
