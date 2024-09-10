#!/bin/sh

assert() {
  if $1; then
    echo "$2: OK"
  else
    echo "$2: FAIL" 1>&2
  fi
}

. ./wootmux.sh

SESSION_NAME=wootmux_test_session

create_test_session() {
  wm_session_new $SESSION_NAME
}

destroy_test_session() {
  wm_session_kill_other "$1"
}

test_wm_session_new() {
  id=$(create_test_session)
  # shellcheck disable=2046
  assert "$(wm_session_exists "$id")" 'wm_session_new'
  destroy_test_session "$id"
}

test_wm_session_new_using_name() {
  id=$(create_test_session)
  # shellcheck disable=2046
  assert "$(wm_session_exists $SESSION_NAME)" 'wm_session_new w/ name'
  destroy_test_session "$id"
}

match_well_formed_pane_uuid() {
  echo "$1" | grep -oP ".*?:.*?\..*"
}

assert_well_formed_pane_uuid() {
  if [ -n "$(match_well_formed_pane_uuid "$1")" ]; then
    result=true
  else
    result=false
  fi
  assert $result "pane_id_is_well_formed"
}

test_wm_pane_uuids() {
  sid=$(create_test_session)
  pane_list="$(wm_session_list_panes "$sid")"
  # echo "pane_list=$pane_list"
  first_pane="$(__list_get_item "$pane_list" 0)"
  pid1=$(wm_pane_new_left "$first_pane")
  pid2=$(wm_pane_new_right "$first_pane")
  pid3=$(wm_pane_new_above "$first_pane")
  pid4=$(wm_pane_new_below "$first_pane")
  assert_well_formed_pane_uuid "$pid1"
  assert_well_formed_pane_uuid "$pid2"
  assert_well_formed_pane_uuid "$pid3"
  assert_well_formed_pane_uuid "$pid4"
  # TODO test that all pane UUIDs are unique
  # TODO test that all pane UUIDs contain the session name
  destroy_test_session "$sid"
}

test_wm_session_new
test_wm_session_new_using_name
test_wm_pane_uuids

# TODO
# wm_session_attach w/ uuid
#
# wm_session_attach w/ name
#
