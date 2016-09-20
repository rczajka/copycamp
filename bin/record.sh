# Włącza screencast.

recordmydesktop --height 1080 --fps 10 --on-the-fly-encoding -o /home/copycamp/prezentacje/zrzuty/dump-`date +%s`.ogv &
echo $! > /home/copycamp/.record.pid

