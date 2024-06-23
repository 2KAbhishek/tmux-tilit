#!/bin/sh
# shellcheck disable=SC2016
# shellcheck disable=SC2086
# shellcheck disable=SC2250

# Whether we need to use legacy workarounds (required before tmux 2.7).
legacy="$(tmux -V | grep -E 'tmux (1\.|2\.[0-6])')"

# Read user options.
for opt in default dmenu easymode navigator prefix shiftnum; do
    export "$opt"="$(tmux show-option -gv @tilit-"$opt" 2>/dev/null)"
done

# Default to US keyboard layout, unless something is configured.
if [ -z "$shiftnum" ]; then
    shiftnum='!@#$%^&*()'
fi

# Determine "arrow types".
if [ "${easymode:-}" = "on" ]; then
    # Simplified arrows.
    h='left'
    j='down'
    k='up'
    l='right'
    H='S-left'
    J='S-down'
    K='S-up'
    L='S-right'
else
    # Vim-style arrows.
    h='h'
    j='j'
    k='k'
    l='l'
    H='H'
    J='J'
    K='K'
    L='L'
fi

# Determine modifier vs. prefix key.
if [ -z "${prefix:-}" ]; then
    bind='bind -n'
    mod='M-'
else
    bind='bind -rT tilit'
    mod=''
fi

# Bind keys to switch between workspaces.
bind_switch() {
    tmux $bind "$1" \
        if-shell "tmux select-window -t :$2" "" "new-window -t :$2"
}

# Bind keys to move panes between workspaces.
bind_move() {
    if [ -z "$legacy" ]; then
        tmux $bind "$1" \
            if-shell "tmux join-pane -t :$2" \
            "" \
            "new-window -dt :$2; join-pane -t :$2; select-pane -t top-left; kill-pane" \\\; select-layout \\\; select-layout -E
    else
        tmux $bind "$1" \
            if-shell "tmux new-window -dt :$2" \
            "join-pane -t :$2; select-pane -t top-left; kill-pane" \
            "send escape; join-pane -t :$2" \\\; select-layout
    fi
}

# Bind keys to switch or refresh layouts.
bind_layout() {
    # Invoke the zoom feature.
    if [ "$2" = "zoom" ]; then
        tmux $bind "$1" \
            resize-pane -Z
    else
        # Actually switch layout.
        if [ -z "$legacy" ]; then
            tmux $bind "$1" \
                select-layout "$2" \\\; select-layout -E
        else
            tmux $bind "$1" \
                run-shell "tmux select-layout \"$2\"" \\\; send escape
        fi
    fi
}

char_at() {
    echo $1 | cut -c $2
}

# Define a prefix key.
if [ -n "$prefix" ]; then
    tmux bind -n "$prefix" switch-client -T tilit
fi

# Switch to workspace via Alt + #.
bind_switch "${mod}1" 1
bind_switch "${mod}2" 2
bind_switch "${mod}3" 3
bind_switch "${mod}4" 4
bind_switch "${mod}5" 5
bind_switch "${mod}6" 6
bind_switch "${mod}7" 7
bind_switch "${mod}8" 8
bind_switch "${mod}9" 9

# Move pane to workspace via Alt + Shift + #.
bind_move "${mod}$(char_at $shiftnum 1)" 1
bind_move "${mod}$(char_at $shiftnum 2)" 2
bind_move "${mod}$(char_at $shiftnum 3)" 3
bind_move "${mod}$(char_at $shiftnum 4)" 4
bind_move "${mod}$(char_at $shiftnum 5)" 5
bind_move "${mod}$(char_at $shiftnum 6)" 6
bind_move "${mod}$(char_at $shiftnum 7)" 7
bind_move "${mod}$(char_at $shiftnum 8)" 8
bind_move "${mod}$(char_at $shiftnum 9)" 9

# The mapping of Alt + 0 and Alt + Shift + 0 depends on `base-index`, either 0 or 10
if [ "$(tmux show-option -gv base-index)" = "1" ]; then
    bind_switch "${mod}0" 10
    bind_move "${mod}$(char_at "$shiftnum" 10)" 10
else
    bind_switch "${mod}0" 0
    bind_move "${mod}$(char_at "$shiftnum" 10)" 0
fi

# Switch layout
bind_layout "${mod}e" 'even-vertical'
bind_layout "${mod}E" 'even-horizontal'
bind_layout "${mod}m" 'main-vertical'
bind_layout "${mod}M" 'main-horizontal'
bind_layout "${mod}T" 'tiled'
bind_layout "${mod}z" 'zoom'

# Refresh the current layout (e.g. after deleting a pane).
if [ -z "$legacy" ]; then
    tmux $bind "${mod}R" select-layout -E
else
    tmux $bind "${mod}R" run-shell 'tmux select-layout'\\\; send escape
fi

# Switch to pane via Alt + hjkl.
tmux $bind "${mod}${h}" select-pane -L
tmux $bind "${mod}${j}" select-pane -D
tmux $bind "${mod}${k}" select-pane -U
tmux $bind "${mod}${l}" select-pane -R

# Move a pane via Alt + Shift + hjkl.
if [ -z "$legacy" ]; then
    tmux $bind "${mod}${H}" swap-pane -s '{left-of}'
    tmux $bind "${mod}${J}" swap-pane -s '{down-of}'
    tmux $bind "${mod}${K}" swap-pane -s '{up-of}'
    tmux $bind "${mod}${L}" swap-pane -s '{right-of}'
else
    tmux $bind "${mod}${H}" run-shell 'old=`tmux display -p "#{pane_index}"`; tmux select-pane -L; tmux swap-pane -t $old'
    tmux $bind "${mod}${J}" run-shell 'old=`tmux display -p "#{pane_index}"`; tmux select-pane -D; tmux swap-pane -t $old'
    tmux $bind "${mod}${K}" run-shell 'old=`tmux display -p "#{pane_index}"`; tmux select-pane -U; tmux swap-pane -t $old'
    tmux $bind "${mod}${L}" run-shell 'old=`tmux display -p "#{pane_index}"`; tmux select-pane -R; tmux swap-pane -t $old'
fi

# Move between windows with Shift + Arrow and Alt + [/] keys
tmux bind -n S-Left previous-window
tmux bind -n S-Right next-window
tmux $bind "${mod}[" previous-window
tmux $bind "${mod}]" next-window

# Open a terminal with Alt + Enter.
if [ -z "$legacy" ]; then
    tmux $bind "${mod}enter" \
        run-shell 'cwd="`tmux display -p \"#{pane_current_path}\"`"; tmux select-pane -t "bottom-right"; tmux split-pane -c "$cwd"'
else
    tmux $bind "${mod}enter" \
        select-pane -t 'bottom-right' \\\; split-window \\\; run-shell 'tmux select-layout' \\\; send escape
fi

# Open horizontal split with Alt + -
tmux $bind "${mod}-" \
    run-shell 'cwd="`tmux display -p \"#{pane_current_path}\"`"; tmux select-pane -t "bottom-right"; tmux split-pane -v -c "$cwd"'
tmux $bind "${mod}," \
    run-shell 'cwd="`tmux display -p \"#{pane_current_path}\"`"; tmux select-pane -t "bottom-right"; tmux split-pane -v -c "$cwd"'

# Open horizontal split with Alt + \
tmux $bind "${mod}\\" \
    run-shell 'cwd="`tmux display -p \"#{pane_current_path}\"`"; tmux select-pane -t "bottom-right"; tmux split-pane -h -c "$cwd"'
tmux $bind "${mod}/" \
    run-shell 'cwd="`tmux display -p \"#{pane_current_path}\"`"; tmux select-pane -t "bottom-right"; tmux split-pane -h -c "$cwd"'

# Name a window with Alt + n.
tmux $bind "${mod}n" \
    command-prompt -p 'Workspace name:' 'rename-window "%%"'

# Close a window with Alt + x
if [ -z "$legacy" ]; then
    tmux $bind "${mod}x" \
        if-shell \
        '[ "$(tmux display-message -p "#{window_panes}")" -gt 1 ]' \
        'kill-pane; select-layout; select-layout -E' \
        'kill-pane'
else
    tmux $bind "${mod}q" \
        kill-pane
fi

# Close a connection with Alt + D.
tmux $bind "${mod}D" detach-client

# Show window list with Alt + w.
tmux $bind "${mod}w" choose-window

# Show session list with Alt + s.
tmux $bind "${mod}s" choose-session

# Reload configuration with Alt + r.
tmux $bind "${mod}r" \
    source-file ~/.tmux.conf \\\; display "Config reloaded"

# Toggle status bar with Alt + b, add - g for global
tmux $bind "${mod}b" set-option status

# Open tmux-tea on Alt + t
tmux $bind "${mod}t" run-shell "tea"

# Open extrakto search with Alt + f
extrakto_open="$TMUX_PLUGIN_MANAGER_PATH/extrakto/scripts/open.sh"
tmux $bind "${mod}f" run-shell "$extrakto_open"

# Open floating terminal with Alt + o
tmux $bind "${mod}o" display-popup -w "90%" -h "90%" -d "#{pane_current_path}" -E "$SHELL"

# Filter all notes with tdo on Alt + a
tmux $bind "${mod}a" display-popup -w "90%" -h "90%" -d "#{pane_current_path}" -E "tdo -f"

# Open floating lazygit with Alt + g
tmux $bind "${mod}g" display-popup -w "90%" -h "90%" -d "#{pane_current_path}" -E "lazygit"

# Define hooks
if [ -z "$legacy" ]; then
    # Autorefresh layout after deleting a pane.
    tmux set-hook -g after-split-window "select-layout; select-layout -E"
    tmux set-hook -g pane-exited "select-layout; select-layout -E"

    # Autoselect layout after creating new window.
    if [ -n "${default:-}" ]; then
        tmux set-hook -g window-linked "select-layout \"$default\"; select-layout -E"
        tmux select-layout "$default"
        tmux select-layout -E
    fi
fi

# If `@tilit-navigator` is nonzero, integrate Ctrl + hjkl with `vim-tmux-navigator`/'Navigator.nvim'.
# This assumes that your Vim/Neovim is setup to use Ctrl + hjkl bindings as well.
if [ "${navigator:-}" = "on" ]; then
    version_pat='s/^tmux[^0-9]*([.0-9]+).*/\1/p'

    is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
    tmux bind-key -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
    tmux bind-key -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
    tmux bind-key -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
    tmux bind-key -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"
    tmux_version="$(tmux -V | sed -En "$version_pat")"
    tmux setenv -g tmux_version "$tmux_version"

    tmux if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
        "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
    tmux if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
        "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

    tmux bind-key -T copy-mode-vi C-h select-pane -L
    tmux bind-key -T copy-mode-vi C-j select-pane -D
    tmux bind-key -T copy-mode-vi C-k select-pane -U
    tmux bind-key -T copy-mode-vi C-l select-pane -R
    tmux bind-key -T copy-mode-vi C-\\ select-pane -l
fi

# Integrate with `fzf` to approximate `dmenu`
if [ -z "$legacy" ] && [ "${dmenu:-}" = "on" ]; then
    if [ -n "$(command -v fzf)" ]; then
        tmux $bind "${mod}d" \
            select-pane -t '{bottom-right}' \\\; split-pane 'sh -c "exec \$(echo \"\$PATH\" | tr \":\" \"\n\" | xargs -I{} -- find {} -maxdepth 1 -mindepth 1 -executable 2>/dev/null | sort -u | fzf)"'
    else
        tmux $bind "${mod}d" \
            display 'To enable this function, install `fzf` and restart `tmux`.'
    fi
fi
