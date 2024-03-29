<div align = "center">

<h1><a href="https://2kabhishek.github.io/tmux-tilit">tmux-tilit</a></h1>

<a href="https://github.com/2KAbhishek/tmux-tilit/blob/main/LICENSE">
<img alt="License" src="https://img.shields.io/github/license/2kabhishek/tmux-tilit?style=flat&color=eee&label="> </a>

<a href="https://github.com/2KAbhishek/tmux-tilit/graphs/contributors">
<img alt="People" src="https://img.shields.io/github/contributors/2kabhishek/tmux-tilit?style=flat&color=ffaaf2&label=People"> </a>

<a href="https://github.com/2KAbhishek/tmux-tilit/stargazers">
<img alt="Stars" src="https://img.shields.io/github/stars/2kabhishek/tmux-tilit?style=flat&color=98c379&label=Stars"></a>

<a href="https://github.com/2KAbhishek/tmux-tilit/network/members">
<img alt="Forks" src="https://img.shields.io/github/forks/2kabhishek/tmux-tilit?style=flat&color=66a8e0&label=Forks"> </a>

<a href="https://github.com/2KAbhishek/tmux-tilit/watchers">
<img alt="Watches" src="https://img.shields.io/github/watchers/2kabhishek/tmux-tilit?style=flat&color=f5d08b&label=Watches"> </a>

<a href="https://github.com/2KAbhishek/tmux-tilit/pulse">
<img alt="Last Updated" src="https://img.shields.io/github/last-commit/2kabhishek/tmux-tilit?style=flat&color=e06c75&label="> </a>

<h3>Better tiling for tmux 🪟🪓</h3>

<figure>
  <img src= "images/screenshot.png" alt="tmux-tilit Demo">
  <br/>
  <figcaption>tmux-tilit screenshot</figcaption>
</figure>

</div>

## What is this

tmux-tilit is a tmux plugin that adds tiling window manager like features and keybindings to tmux.

## Inspiration

tmux-tilit was inspired by [tmux-tilish](https://github.com/jabirali/tmux-tilish).
I wanted to add some new commadns, make the keybindings match better with tmux's defaults, hence tilit was born!

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed the latest version of `tmux` and `tpm`.

## Installing tmux-tilit

To get tmux-tilit, add the following to your `~/.tmux.conf`:

```bash
set -g @plugin '2kabhishek/tmux-tilit'
```

## Using tmux-tilit

### Keybindings

Finally, here is a list of the actual keybindings. Most are [taken from `i3wm`][1].
Below, a "workspace" is what `tmux` would call a "window" and `vim` would call a "tab",
while a "pane" is what `i3wm` would call a "window" and `vim` would call a "split".

| Keybinding                                             | Description                         |
| ------------------------------------------------------ | ----------------------------------- |
| <kbd>Alt</kbd> + <kbd>0</kbd>-<kbd>9</kbd>             | Switch to workspace number 0-9      |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>0-9</kbd>     | Move pane to workspace 0-9          |
| <kbd>Alt</kbd> + <kbd>h/j/k/l</kbd>                    | Move focus left/down/up/right       |
| <kbd>Shift</kbd> + <kbd>Left/Right Arrow</kbd>         | Focus Previous/Next Window          |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>h/j/k/l</kbd> | Move pane left/down/up/right        |
| <kbd>Alt</kbd> + <kbd>Enter</kbd>                      | Create a new pane                   |
| <kbd>Alt</kbd> + <kbd>-</kbd>                          | Horizontal Split                    |
| <kbd>Alt</kbd> + <kbd>\\</kbd>                         | Vertical Split                      |
| <kbd>Alt</kbd> + <kbd>s</kbd>                          | Switch to layout: split then vsplit |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>s</kbd>       | Switch to layout: only split        |
| <kbd>Alt</kbd> + <kbd>v</kbd>                          | Switch to layout: vsplit then split |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>v</kbd>       | Switch to layout: only vsplit       |
| <kbd>Alt</kbd> + <kbd>t</kbd>                          | Switch to layout: fully tiled       |
| <kbd>Alt</kbd> + <kbd>z</kbd>                          | Switch to layout: zoom (fullscreen) |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>r</kbd>       | Refresh current layout              |
| <kbd>Alt</kbd> + <kbd>n</kbd>                          | Name current workspace              |
| <kbd>Alt</kbd> + <kbd>x</kbd>                          | Quit (close) pane                   |
| <kbd>Alt</kbd> + <kbd>d</kbd>                          | tmux dmenu launcher                 |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>d</kbd>       | Detach                              |
| <kbd>Alt</kbd> + <kbd>r</kbd>                          | Reload config                       |
| <kbd>Alt</kbd> + <kbd>b</kbd>                          | Toggle status bar                   |
| <kbd>Alt</kbd> + <kbd>s</kbd>                          | Open session manager, tmux-tea      |
| <kbd>Alt</kbd> + <kbd>f</kbd>                          | Open pane text search, extrakto     |
| <kbd>Alt</kbd> + <kbd>a</kbd>                          | Show all incompelte todos, tdo      |
| <kbd>Alt</kbd> + <kbd>g</kbd>                          | Open lazygit                        |
| <kbd>Alt</kbd> + <kbd>t</kbd>                          | Open floating terminal              |

For detailed instructions please read [DOCS](./DOCS.md)

## How it was built

Major credits to [tmux-tilish](https://github.com/jabirali/tmux-tilish) for the inspiration

tmux-tilit was built using `neovim`

## Challenges faced

Making sure the keybindings work accross different cli programs was challenging.

## What I learned

- Learned more about the tmux api.

## What's next

You tell me!

Hit the ⭐ button if you found this useful.

### 🧰 Tooling

- [dots2k](https://github.com/2kabhishek/dots2k) — Dev Environment
- [nvim2k](https://github.com/2kabhishek/nvim2k) — Personalized Editor
- [sway2k](https://github.com/2kabhishek/sway2k) — Desktop Environment
- [qute2k](https://github.com/2kabhishek/qute2k) — Personalized Browser

### 🔍 More Info

- [tmux-tea](https://github.com/2kabhishek/tmux-tea) — Simple and powerful tmux session manager
- [tmux2k](https://github.com/2kabhishek/tmux2k) — Makes your tmux statusbar pretty!

<div align="center">

<a href="https://github.com/2KAbhishek/tmux-tilit">Source</a> | <a href="https://2kabhishek.github.io/tmux-tilit">Website</a>

</div>
