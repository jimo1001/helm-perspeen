[![MELPA](https://melpa.org/packages/helm-perspeen-badge.svg)](https://melpa.org/#/helm-perspeen)

# helm-perspeen
This package provides **simple manageability** of using [perspeen](https://github.com/seudut/perspeen) workspaces with [helm](https://github.com/emacs-helm/helm) interface.

## Installaton
`helm-perspeen` is available in the [MELPA](https://melpa.org/) archive.
Please, follow the installation instructions from [MELPA](https://melpa.org/) main page and you'll be able to install `helm-perspeen` with:
```
<M-x> package-install helm-perspeen
```

## Features
`M-x helm-perspeen`: Display all workspaces and current workspace's tabs. and allow switching to a buffer.

## Helm Sources
- `helm-source-perspeen-tabs`: List tags in the current workspace.
- `helm-source-perspeen-workspaces`: List All workspaces.
- `helm-source-perspeen-create-workspace`: Create new workspace

## Configuration
Using [use-package](https://github.com/jwiegley/use-package):
``` emacs-lisp
(use-package helm-perspeen :ensure t)
```

### Example (`.emacs`)
``` emacs-lisp
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require 'use-package)

(use-package powerline
  :config
  (powerline-default-theme))

(use-package perspeen
  :init
  (setq perspeen-use-tab t)
  :config
  (perspeen-mode +1))

(use-package helm
  :bind
  (("C-c z" . helm-perspeen))
  :config
  (use-package helm-projectile)
  (use-package helm-perspeen)

  (setq helm-mini-default-sources
        '(helm-source-perspeen-tabs
          helm-source-buffers-list
          helm-source-perspeen-workspaces
          helm-source-projectile-projects
          helm-source-recentf
          helm-source-buffer-not-found))
  (helm-mode 1))
```
