# wootmux
## Wanted: Object-Oriented Tmux

A simple tmux wrapper that tries to be Object Oriented.

### installion

```sh
curl https://raw.githubusercontent.com/patreeceeo/wootmux/main/wootmux.sh > wootmux.sh
```

### Example Usage

See [an example in another project](https://github.com/patreeceeo/zomboban/blob/main/dev.sh) or this project's own dev.sh.

### API

You can't really do OOP in POSIX Shell. Instead, we use functions in the form of a "wm\_&lt;object&gt;\_new\_*" that creates an <object> and returns its UUID. We can then use this UUID to perform further actions with this object.

#### Sessions
##### New

```sh
my_session_id=$(wm_session_new "my_session") # Creates a session named my_session and assigns its UUID to my_session_id
# Note: the session name ("my_session") can also be used as its UUID if we're sure it's unique.
```

##### Attach

```sh
wm_session_attach <session_uuid> # attaches client to given session
```

### WOOT!


