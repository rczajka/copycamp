# Pzrełącza Prezi w tryb pełnoekranowy na głównym ekranie.

fluxbox-remote "ForEach {SetDecor None} {Matches (Prezi.exe)}"
fluxbox-remote "ForEach {SetHead 2} {Matches (Prezi.exe)}"
fluxbox-remote "ForEach {SetDecor None} {Matches (Prezi.exe)}"
fluxbox-remote "ForEach {ResizeTo 100% 100%} {Matches (Prezi.exe)}"
fluxbox-remote "ForEach {MoveTo 0 0} {Matches (Prezi.exe)}"

sleep 1
fluxbox-remote "ForEach {SetDecor None} {Matches (Prezi.exe)}"
fluxbox-remote "ForEach {ResizeTo 100% 100%} {Matches (Prezi.exe)}"
fluxbox-remote "ForEach {MoveTo 0 0} {Matches (Prezi.exe)}"

sleep 1
fluxbox-remote "ForEach {MoveTo 0 0} {Matches (Prezi.exe)}"
