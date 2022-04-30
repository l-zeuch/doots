# Do not create a history file in $HOME.
# (I really hate clutter)
import readline
readline.write_history_file = lambda *args: None
