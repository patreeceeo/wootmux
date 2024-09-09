#!/bin/sh
# I love dogfood.

. ./wootmux.sh

if [ "$(wm_session_exists wootmux)" ]; then
  echo "attaching to existing session"
  wm_session_attach wootmux
  exit 0
fi

wm_session_new wootmux

wm_pane_new_left "$(wm_session_active_pane)" nvim

wm_session_attach wootmux
