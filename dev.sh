#!/bin/sh
# I love dogfood.

. ./wootmux.sh

if [ "$(wm_session_exists wootmux)" ]; then
  echo "attaching to existing session"
  wm_session_attach wootmux
  exit 0
fi

wm_use_clipboard

wm_session_new wootmux

wm_pane_new_left "$(wm_pane_current)" nvim

wm_session_attach wootmux
