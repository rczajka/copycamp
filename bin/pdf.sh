# Uruchamia prezentację w formacie PDF.

/home/copycamp/bin/to-pres.sh

pdf-presenter-console "$1" &
fbsetbg -l

(
sleep 3
fluxbox-remote "ForEach {ResizeTo 100% 880} {Matches (Title=pdf-presenter-console) (@WM_WINDOW_ROLE=presenter)}"

sleep 3
fluxbox-remote "ForEach {ResizeTo 100% 880} {Matches (Title=pdf-presenter-console) (@WM_WINDOW_ROLE=presenter)}"

sleep 3
fluxbox-remote "ForEach {ResizeTo 100% 880} {Matches (Title=pdf-presenter-console) (@WM_WINDOW_ROLE=presenter)}"

sleep 3
fluxbox-remote "ForEach {ResizeTo 100% 880} {Matches (Title=pdf-presenter-console) (@WM_WINDOW_ROLE=presenter)}"

fbsetbg -l

) &

