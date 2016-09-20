# Ustawia ekrany w tryb "podgląd", w którym prelegent ekran
# prelegenta nie pokrywa się z głównym ekranem.

xrandr --output VGA-0 --auto --pos 0x1600 --scale-from 1920x1080
~/bin/timer-dol.sh


(
pid="`cat ~/.timer.pid`"
fluxbox-remote "ForEach {SetHead 1} {Matches (@_NET_WM_PID=$pid)}"
sleep 1
fluxbox-remote "ForEach {MoveTo 0 0 Bottom} {Matches (@_NET_WM_PID=$pid)}"
) &

