. ./wootmux.sh

if [ "$(wm_session_exists repeet_code)" ]; then
  echo "attaching to existing session"
  wm_session_attach repeet_code
  exit 0
fi

wm_session_new repeet_code

wm_pane_new_left "$(wm_session_active_pane)" nvim

wm_session_attach repeet_code
