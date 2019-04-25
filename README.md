# UpBroadcast
This is a simple program that sends UDP broadcast packet.
Program is meant to be run once on system startup.
# Packet content
Assuming that your server hostname is `HOSTNAME`:
```
UpBroadcast: HOSTNAME up
```
# Why this is a thing?
My server in basement takes long time to boot, so I made this program
to send UDP packet when server is ready. My VPS then captures this
packet, and sends me message on telegram.