# Uruchamia prezentację w formatach ODP i pokrewnych.

/home/copycamp/bin/to-pres.sh
libreoffice --show "$1" &
sleep 2
fluxbox-remote "ForEach {ResizeTo 100% 880} {Matches (Title=.*LibreOffice Impress)}"

sleep 1
fluxbox-remote "ForEach {ResizeTo 100% 880} {Matches (Title=.*LibreOffice Impress)}"
sleep 1
fluxbox-remote "ForEach {ResizeTo 100% 880} {Matches (Title=.*LibreOffice Impress)}"

fbsetbg -l
