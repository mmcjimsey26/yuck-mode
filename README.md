<div align="center">

# yuck-mode

[![MELPA](https://melpa.org/packages/yuck-mode-badge.svg)](https://melpa.org/#/yuck-mode)

Emacs major mode for editing yuck configuration files for [ElKowar's Wacky Widgets (eww)](https://github.com/elkowar/eww). I'll answer your burning questions below.

</div>

## Note:
This package is not yet available on MELPA, although it will be in the near future.

## What even is this?

`yuck-mode` is a barebones (65 sloc) major mode for editing yuck config files. It is nothing more than the most minimal major mode that you can think of.
`yuck-mode` only includes syntax highlighting functionality. Everything else is inherited through Emacs' `prog-mode`. `yuck-mode` is not Flycheck, so don't expect linting. I may add this feature in the future, but it does seem a bit overkill.

## Why?

Large and convoluted configuration files often obscure exactly what's going on and can introduce problems that can be solved
even with simple syntax highlighting. It may not be for everyone, but it can be useful at times.

## What features are there?

+ Syntax highlighting for all keywords and widget types in the yuck configuration language.
+ Indentation
+ Commenting

That's literally everything.

## How do I install it?

`yuck-mode` is available on [MELPA](https://melpa.org/#/yuck-mode) so if you have MELPA configured then you can do a
`package-install` yuck-mode.

Or if you are using straight:

``` lisp
(straight-use-package 'yuck-mode)
```

Or if you are using Doom Emacs add the following to your `~/.doom.d/packages.el`:

``` lisp
(package! yuck-mode)
```

## How do I contribute?

If you want to contribute anything, from fixing a bug to adding new 
features, feel free to fork the repo and open a pull request as soon as you're finished.
