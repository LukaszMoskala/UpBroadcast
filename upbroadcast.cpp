/*
Copyright (C) 2019 Łukasz Konrad Moskała

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
#include <iostream>
#include <SFML/Network.hpp>
#include <unistd.h>
#include <limits.h>
#include <cstring>

using namespace std;

int main() {
    //from:
    //https://stackoverflow.com/questions/27914311/get-computer-name-and-logged-user-name
    char hostname[HOST_NAME_MAX+1];
    memset(hostname, 0, sizeof(hostname));
    gethostname(hostname, HOST_NAME_MAX);

    sf::IpAddress recipient = "255.255.255.255";
    unsigned short port = 64665;
    sf::UdpSocket socket;

    string data="UpBroadcast: ";
    data+=string(hostname);
    data+=" up";

    if (socket.send(data.c_str(), data.size(), recipient, port) != sf::Socket::Done)
    {
        cout<<"Failed to send UDP Broadcast packet"<<endl;
    }
}