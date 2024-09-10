# wootmux
## Wanted: Object-Oriented Tmux

A simple tmux wrapper that tries to be Object Oriented. [Read more about the idea of OOP and tmux in this blog post](https://innerlogic.co/2024/09/10/taking-the-hell-out-of-shell-making-tmux-object-oriented/).

### installion

```sh
curl https://raw.githubusercontent.com/patreeceeo/wootmux/main/wootmux.sh > wootmux.sh
```

### Example Usage

See [an example in another project](https://github.com/patreeceeo/zomboban/blob/main/dev.sh) or this project's own dev.sh.

### Public API

You can't really do OOP in POSIX Shell. Instead, we use functions in the form of "wm\_&lt;object&gt;\_new" or "wm\_&lt;object&gt;\_new\_<modifier>" that creates an <object> and returns its UUID. We can then use this UUID to perform further actions with this object.

#### Session
##### new

```sh
my_session_id=$(wm_session_new "my_session") # Creates a session named my_session and assigns its UUID to my_session_id
```

##### exists?

```sh
[ wm_session_exists "$my_session_name_or_id" ] && echo "this session exists"
```

##### attach

```sh
wm_session_attach "$my_session_name_or_id" # attaches client to given session
```

##### current

```sh
my_session_id=$(wm_session_current) # get UUID of current session
```

##### kill

```sh
wm_session_kill "$my_session_name_or_id" # it's gone
```

#### Pane
##### new_&lt;direction&gt;

```
wm_pane_new_left "$my_pane_id" # Split window containing $my_pane_id such that the new pane is to the left
```

### WOOT!


