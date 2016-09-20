# Ustawia prawidłowe rozdzielczości i położenia podłączonych ekranów.

xrandr --output LVDS-0 --off
xrandr --output DP-0 --mode 1920x1080 --pos 0x0
xrandr --output VGA-0 --auto --primary

~/bin/ekrany-podglad.sh

