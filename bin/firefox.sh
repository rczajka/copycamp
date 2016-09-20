# Uruchamia Firefoksa jako podręczną przeglądarkę,
# gdyby potrzebował jej prelegent.  Przeglądarkę
# trzymamy ukrytą na drugim pulpicie i w razie potrzeby
# przełączamy się na nią przy użyciu to-firefox.sh.

firefox --no-remote -p default &
pid=$!
echo $pid > /home/copycamp/.firefox.pid

sleep 2

fluxbox-remote "ForEach {SetHead 1} {Matches (@_NET_WM_PID=$pid)}"

fluxbox-remote "ForEach {SendToWorkspace 2} {Matches (@_NET_WM_PID=$pid)}"

fluxbox-remote "ForEach {SetDecor None} {Matches (@_NET_WM_PID=$pid)}"
fluxbox-remote "ForEach {ResizeTo 100% 100%} {Matches (@_NET_WM_PID=$pid)}"
fluxbox-remote "ForEach {MoveTo 0 0} {Matches (@_NET_WM_PID=$pid)}"

sleep 1
fluxbox-remote "ForEach {SetDecor None} {Matches (@_NET_WM_PID=$pid)}"
fluxbox-remote "ForEach {ResizeTo 100% 100%} {Matches (@_NET_WM_PID=$pid)}"
fluxbox-remote "ForEach {MoveTo 0 0} {Matches (@_NET_WM_PID=$pid)}"

sleep 1
fluxbox-remote "ForEach {SetDecor None} {Matches (@_NET_WM_PID=$pid)}"
fluxbox-remote "ForEach {ResizeTo 100% 100%} {Matches (@_NET_WM_PID=$pid)}"
fluxbox-remote "ForEach {MoveTo 0 0} {Matches (@_NET_WM_PID=$pid)}"


