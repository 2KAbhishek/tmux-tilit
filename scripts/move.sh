#!/usr/bin/env bash

set -euo pipefail

direction="${1:-}"

num_panes=$(tmux display-message -p '#{window_panes}')
if [ "$num_panes" -le 1 ]; then
    exit 0
fi

IFS=',' read -r cur_id at_left at_top at_right at_bottom < <(
    tmux display-message -p '#{pane_id},#{pane_at_left},#{pane_at_top},#{pane_at_right},#{pane_at_bottom}'
)

get_target() {
    tmux list-panes -F '#{pane_id}' | grep -v -F "$cur_id" | head -n 1
}

case "$direction" in
    left)
        if [ "$at_left" = "1" ] && [ "$at_right" = "0" ]; then
            exit 0
        elif [ "$at_left" = "1" ] && [ "$at_right" = "1" ]; then
            target=$(get_target)
            [ -n "$target" ] && tmux join-pane -b -f -h -s "$cur_id" -t "$target" && tmux select-layout -E
        else
            tmux swap-pane -s '{left-of}' 2>/dev/null || true
        fi
        ;;
    right)
        if [ "$at_right" = "1" ] && [ "$at_left" = "0" ]; then
            exit 0
        elif [ "$at_right" = "1" ] && [ "$at_left" = "1" ]; then
            target=$(get_target)
            [ -n "$target" ] && tmux join-pane -f -h -s "$cur_id" -t "$target" && tmux select-layout -E
        else
            tmux swap-pane -s '{right-of}' 2>/dev/null || true
        fi
        ;;
    up)
        if [ "$at_top" = "1" ] && [ "$at_bottom" = "0" ]; then
            exit 0
        elif [ "$at_top" = "1" ] && [ "$at_bottom" = "1" ]; then
            target=$(get_target)
            [ -n "$target" ] && tmux join-pane -b -f -v -s "$cur_id" -t "$target" && tmux select-layout -E
        else
            tmux swap-pane -s '{up-of}' 2>/dev/null || true
        fi
        ;;
    down)
        if [ "$at_bottom" = "1" ] && [ "$at_top" = "0" ]; then
            exit 0
        elif [ "$at_bottom" = "1" ] && [ "$at_top" = "1" ]; then
            target=$(get_target)
            [ -n "$target" ] && tmux join-pane -f -v -s "$cur_id" -t "$target" && tmux select-layout -E
        else
            tmux swap-pane -s '{down-of}' 2>/dev/null || true
        fi
        ;;
    *)
        exit 1
        ;;
esac
