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

tmux-tilit brings tiling window manager features and smooth keybindings to your tmux sessions, boosting your productivity like never before.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed the latest version of `tmux (>= 3.0)` and [`tpm`](https://github.com/tmux-plugins/tpm).

## Installing tmux-tilit

To get tmux-tilit, add the following to your `tmux.conf`:

```bash
set -g @plugin '2kabhishek/tmux-tilit'
```

## Using tmux-tilit

### Keybindings

All the configured keybindings can be found in the [keybinding manual here](./docs/keybindings.md).

### Customizing tmux-tilit

#### `easymode` for arrow key navigation

To navigate using arrow keys, you can enable easy mode with: `set -g @tilit-easymode 'on'`

The revised keybindings for the pane focus and movement then become:

| Keybinding                                                          | Description              |
| ------------------------------------------------------------------- | ------------------------ |
| <kbd>Alt</kbd> + <kbd>&#8592;/&#8595;/&#8593;/&#8594;</kbd>         | Focus pane in direction  |
| <kbd>Alt</kbd> + <kbd>Shift + &#8592;/&#8595;/&#8593;/&#8594;</kbd> | Move pane in direction   |
| <kbd>Alt</kbd> + <kbd>h/j/k/l</kbd>                                 | Resize pane in direction |

#### `layout` for customizing default layout

You can set the default layout with `set -g @tilit-default 'layout'`, this will be used when creating new windows or panes.

Available layouts are:

- `main-vertical`
- `main-horizontal`
- `tiled`
- `even-vertical`
- `even-horizontal`

#### `navigator` for integrating with vim/neovim

To setup navigation with neovim install [Navigator.nvim][4] and for vim use [vim-tmux-navigator][5]

Then, in your `~/.tmux.conf` add:

```bash
set -g @tilit-navigator 'on'
```

This will let you seamlessly navigate between vim/neovim splits and tmux panes with <kbd>Ctrl</kbd> + <kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd>.

[4]: https://github.com/numToStr/Navigator.nvim
[5]: https://github.com/christoomey/vim-tmux-navigator

#### `prefix` for integrating with window managers

If your window manager uses <kbd>Alt</kbd> as default modifier, it's recommended to switch to <kbd>Super</kbd> or <kbd>Meta</kbd> for a smoother experience.

If you do not want to do that you can enable prefix mode and faster repeat-time in tmux:

```bash
set -g @tilit-prefix 'M-space'
set -g repeat-time 1000
```

This will let you hit <kbd>Alt</kbd> + <kbd>Space</kbd> and then a key to perform an action, repeat time lets you run more actions with a single prefix.

#### `shiftnum` for working with international keyboards

You can set the `@tilit-shiftnum` option to match your keyboard layout:

```bash
# US Keyboard
set -g @tilit-shiftnum '!@#$%^&*()'
# UK Keyboard
set -g @tilit-shiftnum '!"£$%^&*()'
```

## How I built this

Major credits to [tmux-tilish](https://github.com/jabirali/tmux-tilish) for the inspiration
I wanted to add some new commands and integrations, make the keybindings match better with tmux defaults.

## Challenges faced

Making sure the keybindings work across different command line programs and environments was challenging.

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
