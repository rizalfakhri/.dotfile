<table><tbody align="center"><tr><td>
<h1>vim-substrata</h1>
<img src="https://raw.githubusercontent.com/arzg/resources/master/substrata-screenshot.png"/>
<h3>a cold, dark colourscheme for Vim</h3>
<em>made in <a href="https://github.com/lifepillar/vim-colortemplate">Colortemplate</a>, the Toolkit for Vim Colourscheme Designers</em>
<em>inspired by <a href="https://www.nordtheme.com/ports/vim">Nord</a> and <a href="https://cocopon.github.io/iceberg.vim/">Iceberg</a></em>
</td></tr></tbody></table>

## Installation

Use *your* favorite runtimepath/plugin manager, or place `substrata.vim` into
`~/.vim/colors/` for \*nix and `%userprofile%\vimfiles\colors\` for Windows.

## Usage

### Vim

Substrata should work out of the box if you’re using a GUI Vim such as GVim or MacVim. Terminal usage, however, requires the terminal supporting 24-bit colour, also known as True Colour.

```
set termguicolors " Only needed in terminals
colorscheme substrata
```

### Terminal

If you want other terminal output to match with Substrata, then set your terminal emulator’s colours to match the ones below:

| Colour     | Normal    | Bright    |
| ---        | ---       | ---       |
| Black      | `#2e313d` | `#5b5f71` |
| Red        | `#cf8164` | `#fe9f7c` |
| Green      | `#76a065` | `#92c47e` |
| Yellow     | `#ab924c` | `#d2b45f` |
| Blue       | `#8296b0` | `#a0b9d8` |
| Magenta    | `#a18daf` | `#c6aed7` |
| Cyan       | `#659ea2` | `#7dc2c7` |
| White      | `#b5b4c9` | `#f0ecfe` |
| Foreground | `#b5b4c9` |           |
| Background | `#191c25` |           |

A preset is included for iTerm and in Xresources format. The Xresources format can be used either by copying the contents of `xresources/substrata.xresources` into `~/.Xresources`, or, if you would prefer to keep the theme in a separate file, you can instead include it with the following syntax:

```
#include "/path/to/substrata.xresources"
```

## Screenshots

Note that the screenshots below are likely to be slightly out of date. The typeface used in the screenshots is [iA Writer Mono][iafont], which is derived from [IBM Plex Mono][ibmfont].

![The popup menu in Substrata](https://raw.githubusercontent.com/arzg/resources/master/substrata-popup.png)*Popup menu*
![Searching in Substrata](https://raw.githubusercontent.com/arzg/resources/master/substrata-search.png)*Searching*
![Showing the diff between two files in Substrata](https://raw.githubusercontent.com/arzg/resources/master/substrata-diff.png)*Diffing*
![Writing in Substrata](https://raw.githubusercontent.com/arzg/resources/master/substrata-goyo.png)*Writing using [Goyo][goyo] and [Limelight][lime]*
![Visual selections in Substrata](https://raw.githubusercontent.com/arzg/resources/master/substrata-visual.png)*Visual mode*
![Fugitive in Substrata](https://raw.githubusercontent.com/arzg/resources/master/substrata-git.png)*[Fugitive][fug]*

## Inspiration

Substrata was inspired by these colourschemes (they’re great, you should check them out!):

- [Apprentice][appr]
- [Blame][blame]
- [Iceberg][ice]
- [Nord][nord]

[appr]: https://github.com/romainl/Apprentice
[blame]: https://github.com/hauleth/blame.vim
[fug]: https://github.com/tpope/vim-fugitive
[goyo]: https://github.com/junegunn/goyo.vim
[iafont]: https://github.com/iaolo/iA-Fonts/tree/master/iA%20Writer%20Mono
[ibmfont]: https://github.com/IBM/plex
[ice]: https://github.com/cocopon/iceberg.vim
[lime]: https://github.com/junegunn/limelight.vim
[nord]: https://www.nordtheme.com/ports/vim
