#!/usr/bin/env sh

lock() {
	betterlockscreen -l blur &
}

play_poweroff() {
    ffplay -v 0 -nodisp -autoexit "$HOME/Desktop/Music/shutdown.mp3"
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        play_poweroff && i3-msg exit
        ;;
    suspend)
        lock && systemctl suspend
        ;;
    reboot)
        play_poweroff && systemctl reboot
        ;;
    shutdown)
        play_poweroff && systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
