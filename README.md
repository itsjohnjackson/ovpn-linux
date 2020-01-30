# ovpn-linux

Note: This will not work by default, changes must be made. Please read everything on here.

Simple bash script for selecting ovpn configurations within linux.\
In my case it's a choice between a TCP and UDP VPN connection.

Pretty pointless and not much of a timesaver, but i wanted something i could mindlessly run and show me IP changes to ensure the VPN connection was established almost instantly.

# What it does:
Allows you to select an OpenVPN Config.\
Connects to the VPN via a daemon.\
Shows IP address prior to connecting and afterwards.

# Limits:
Each config must be manually added. (Dynamic updating each run is not required for me)\
OpenVPN and configs must be in the '/etc/openvpn/' directory. (Script can be altered)\
No error outputting! (This is a big one, ensure you can manually connect before running through the script)

# Prerequisites
Ensure OpenVPN is installed and located within '/etc/openpvn/'.\
Ensure the OpenVPN configuration files have the following lines appended to the end:\
'''\
script-security 2\
up /etc/openvpn/update-resolv-conf\
down /etc/openvpn/update-resolv-conf\
'''\
See http://www.ubuntubuzz.com/2015/09/how-to-fix-openvpn-dns-leak-in-linux.html for more info.

# Requirements
Basic shell/bash scripting knowledge helps.\
Comments are throughout the '.sh' file starting with '<<', these comments indicate areas where changes must be made by users to allow the script to work on their machine. It also indicates where to add/remove lines for less/more configurations.
