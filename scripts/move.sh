#!/usr/bin/env bash

set -euo pipefail

direction="${1:-}"

num_panes=$(tmux display-message -p '#{window_panes}')
[ "$num_panes" -le 1 ] && exit 0

IFS=',' read -r cur_id at_left at_top at_right at_bottom < <(
    tmux display-message -p '#{pane_id},#{pane_at_left},#{pane_at_top},#{pane_at_right},#{pane_at_bottom}'
)

case "$direction" in
    left)  at_target="$at_left";   at_opposite="$at_right";  axis="-h"; before="-b" ;;
    right) at_target="$at_right";  at_opposite="$at_left";   axis="-h"; before=""   ;;
    up)    at_target="$at_top";    at_opposite="$at_bottom"; axis="-v"; before="-b" ;;
    down)  at_target="$at_bottom"; at_opposite="$at_top";    axis="-v"; before=""   ;;
    *)     exit 1 ;;
esac

if [ "$at_target" = "1" ]; then
    if [ "$at_opposite" = "1" ]; then
        target=$(tmux list-panes -F '#{pane_id}' | grep -v -F "$cur_id" | head -n 1)
        if [ -n "$target" ]; then
            # shellcheck disable=SC2086
            tmux join-pane ${before:+$before} -f "$axis" -s "$cur_id" -t "$target"
            tmux select-layout -E
        fi
    fi
    exit 0
fi

tmux swap-pane -s "{$direction-of}" 2>/dev/null || true
