# Poprawia pozycję okna timera, która może się zmienić
# podczas manipulacji położeniem ekranów w obszarze roboczym.

pid=`cat /home/copycamp/.timer.pid`
fluxbox-remote "ForEach {SetHead 1} {Matches (@_NET_WM_PID=$pid)}"
fluxbox-remote "ForEach {ResizeTo 1920 200} {Matches (@_NET_WM_PID=$pid)}"
fluxbox-remote "ForEach {MoveTo 0 0 Bottom} {Matches (@_NET_WM_PID=$pid)}"

