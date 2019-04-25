CC=gcc
CXX=g++
#append these flags to command line flags
override CXXFLAGS+=-O2 --std=c++17
CXXLIBS=-lsfml-network
PREFIX=/usr/local
SYSTEMD_LOCATION=/etc/systemd/system
all: upbroadcast
upbroadcast.o: upbroadcast.cpp
	$(CXX) $(CXXFLAGS) -c -o upbroadcast.o upbroadcast.cpp
upbroadcast: upbroadcast.o
	$(CXX) $(CXXFLAGS) -o upbroadcast upbroadcast.o $(CXXLIBS)
install: upbroadcast
	install -m 775 upbroadcast $(PREFIX)/bin/
clean:
	rm -f upbroadcast.o
installservice:
	install -m 644 upbroadcast.service $(SYSTEMD_LOCATION)/
installconfig:
	install -m 644 example.conf /etc/upbroadcast.conf
installall: installservice installconfig install