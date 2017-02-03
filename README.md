# helm-perspeen

This package provides **simple manageability** of using [perspeen](https://github.com/seudut/perspeen) workspaces with [helm](https://github.com/emacs-helm/helm) interface.

## Installaton (`to be prepared`)
`helm-perspeen` is available in the [MELPA](https://melpa.org/) archive.
Please, follow the installation instructions from [MELPA](https://melpa.org/) main page and you'll be able to install `helm-perspeen` with:
```
<M-x> package-install helm-perspeen
```

## Configuration
Using [use-package](https://github.com/jwiegley/use-package):
``` emacs-lisp
(use-package helm-perspeen :ensure t)
```

## Features
`M-x helm-perspeen`: Display all workspaces and current workspace's tabs. and allow switching to a buffer.

## Helm Sources
- `helm-source-perspeen-tabs`: List tags in the current workspace.
- `helm-source-perspeen-workspaces`: List All workspaces.
- `helm-source-perspeen-create-workspace`: Create new workspace
