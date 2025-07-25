# [tmux-tilit](https://github.com/2KAbhishek/tmux-tilit) [Keybindings](https://github.com/2KAbhishek/tmux-tilit/blob/main/docs/keybindings.md)

## General Bindings

| Keybinding                                                  | Action                    |
| ----------------------------------------------------------- | ------------------------- |
| <kbd>Alt</kbd> + <kbd>`</kbd>                               | Last active window        |
| <kbd>Alt</kbd> + <kbd>,</kbd>                               | Rename current window     |
| <kbd>Alt</kbd> + <kbd>/</kbd>                               | Horizontal Split          |
| <kbd>Alt</kbd> + <kbd>\</kbd>                               | Vertical Split            |
| <kbd>Alt</kbd> + <kbd>[ or ]</kbd>                          | Focus prev/next window    |
| <kbd>Alt</kbd> + <kbd>- / =</kbd>                           | Increase / Decrease width |
| <kbd>Alt</kbd> + <kbd>&#8592;/&#8595;/&#8593;/&#8594;</kbd> | Resize pane in direction  |
| <kbd>Alt</kbd> + <kbd>0-9</kbd>                             | Switch to window 0-9      |
| <kbd>Alt</kbd> + <kbd>Enter</kbd>                           | Create a new pane         |
| <kbd>Alt</kbd> + <kbd>Shift + 0-9</kbd>                     | Move pane to window 0-9   |
| <kbd>Alt</kbd> + <kbd>Shift + C</kbd>                       | Customize mode            |
| <kbd>Alt</kbd> + <kbd>Shift + D</kbd>                       | Detach                    |
| <kbd>Alt</kbd> + <kbd>Shift + E</kbd>                       | Layout: Even Horizontal   |
| <kbd>Alt</kbd> + <kbd>Shift + H/J/K/L</kbd>                 | Move pane in direction    |
| <kbd>Alt</kbd> + <kbd>Shift + I</kbd>                       | Open tilit keybindings    |
| <kbd>Alt</kbd> + <kbd>Shift + M</kbd>                       | Layout: Main Horizontal   |
| <kbd>Alt</kbd> + <kbd>Shift + R</kbd>                       | Rotate window             |
| <kbd>Alt</kbd> + <kbd>Shift + T</kbd>                       | Layout: Tiled             |
| <kbd>Alt</kbd> + <kbd>Shift + X</kbd>                       | Close window              |
| <kbd>Alt</kbd> + <kbd>a</kbd>                               | Command mode              |
| <kbd>Alt</kbd> + <kbd>b</kbd>                               | Toggle status bar         |
| <kbd>Alt</kbd> + <kbd>c</kbd>                               | Edit config               |
| <kbd>Alt</kbd> + <kbd>d</kbd>                               | Run launcher, [dexe][3]   |
| <kbd>Alt</kbd> + <kbd>e</kbd>                               | Layout: Even Vertical     |
| <kbd>Alt</kbd> + <kbd>f</kbd>                               | Text grab, [extrakto][2]  |
| <kbd>Alt</kbd> + <kbd>g</kbd>                               | Open lazygit              |
| <kbd>Alt</kbd> + <kbd>h/j/k/l</kbd>                         | Focus pane in direction   |
| <kbd>Alt</kbd> + <kbd>i</kbd>                               | Synchronize pane inputs   |
| <kbd>Alt</kbd> + <kbd>m</kbd>                               | Layout: Main Vertical     |
| <kbd>Alt</kbd> + <kbd>n</kbd>                               | Show daily todos [tdo][1] |
| <kbd>Alt</kbd> + <kbd>N</kbd>                               | Show all notes [tdo][1]   |
| <kbd>Alt</kbd> + <kbd>o</kbd>                               | Open floating terminal    |
| <kbd>Alt</kbd> + <kbd>p</kbd>                               | Last active pane          |
| <kbd>Alt</kbd> + <kbd>q</kbd>                               | Close session             |
| <kbd>Alt</kbd> + <kbd>r</kbd>                               | Reload config             |
| <kbd>Alt</kbd> + <kbd>s</kbd>                               | Switch between all panse  |
| <kbd>Alt</kbd> + <kbd>t</kbd>                               | Session manager [tea][1]  |
| <kbd>Alt</kbd> + <kbd>w</kbd>                               | Move pane to new window   |
| <kbd>Alt</kbd> + <kbd>x</kbd>                               | Close pane                |
| <kbd>Alt</kbd> + <kbd>y</kbd>                               | Copy mode                 |
| <kbd>Alt</kbd> + <kbd>z</kbd>                               | Layout: Zoom              |
| <kbd>Shift</kbd> + <kbd>&#8592;/&#8594;</kbd>               | Focus prev/next window    |

## Prefix Bindings

tmux-tilit sets up keybindings that work with the tmux `prefix` key:

| Keybinding         | Action                   |
| ------------------ | ------------------------ |
| <kbd>H/J/K/L</kbd> | Resize pane in direction |
| <kbd>r</kbd>       | Reload config            |

> Default `prefix` key is <kbd>Ctrl</kbd> + <kbd>b</kbd>, I recommend <kbd>Ctrl</kbd> + <kbd>a</kbd>

You can remap the `prefix` key by adding this to your `tmux.conf`:

```bash
# Change prefix
set -g prefix C-a
bind C-a send-prefix
```

## Copy Mode Bindings

Enable copy mode by pressing <kbd>Alt</kbd> + <kbd>y</kbd>:

> This mode supports vi navigation keys by default

| Keybinding                  | Action                      |
| --------------------------- | --------------------------- |
| <kbd>y</kbd>                | Copy                        |
| <kbd>C</kbd> + <kbd>v</kbd> | Toggle block/rectangle mode |
| <kbd>v</kbd>                | Start selection             |
| <kbd>V</kbd>                | Line selection              |

[1]: https://github.com/2KAbhishek/tdo
[2]: https://github.com/laktak/extrakto
[3]: https://github.com/2KAbhishek/dexe
[1]: https://github.com/2KAbhishek/tmux-tea
