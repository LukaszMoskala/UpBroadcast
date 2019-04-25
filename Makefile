CC=gcc
CXX=g++
#append these flags to command line flags
override CXXFLAGS+=-O2 --std=c++17
CXXLIBS=-lsfml-network
PREFIX=/usr/local
all: upbroadcast
upbroadcast.o: upbroadcast.cpp
	$(CXX) $(CXXFLAGS) -c -o upbroadcast.o upbroadcast.cpp
upbroadcast: upbroadcast.o
	$(CXX) $(CXXFLAGS) -o upbroadcast upbroadcast.o $(CXXLIBS)
install:
	install -m 775 upbroadcast $(PREFIX)/bin/
clean:
	rm -f upbroadcast.o