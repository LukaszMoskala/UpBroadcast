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
# How to test?
run `nc -vvulp 64665` on one terminal and `upbroadcast` on other
# Dependencies
Program depends on `SFML`, because I wanted to keep things simple.
Instead of writing my own library, everything is provided
by `SFML/Network.hpp`.