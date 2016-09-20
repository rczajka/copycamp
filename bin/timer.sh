# Włącza okno timera.

firefox --no-remote -p timer http://localhost/timer &
pid=$!
echo $pid > /home/copycamp/.timer.pid
sleep 3

fluxbox-remote "ForEach {SetDecor None} {Matches (@_NET_WM_PID=$pid)}"
fluxbox-remote "ForEach {SetLayer AboveDock} {Matches (@_NET_WM_PID=$pid)}"
fluxbox-remote "ForEach {Stick} {Matches (@_NET_WM_PID=$pid)}"

/home/copycamp/bin/timer-dol.sh


