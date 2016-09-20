# Przełącza ekrany w trym "mirror", w którym prelegent
# widzi na swoim monitorze zawartość głównego ekranu + timer.

xrandr --output VGA-0 --auto --pos 0x0 --scale-from 1920x1280
fbsetbg -l
~/bin/timer-dol.sh
(
sleep 1
fbsetbg -l
~/bin/timer-dol.sh
)

