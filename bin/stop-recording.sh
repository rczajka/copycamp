# Wyłącza screencast.

if [ -e /home/copycamp/.record.pid ]
then
	kill `cat /home/copycamp/.record.pid`
	rm /home/copycamp/.record.pid
fi
