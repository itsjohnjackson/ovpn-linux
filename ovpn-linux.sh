#!/bin/bash

clear
previousip="$(wget -O - -q icanhazip.com)"

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

cd /etc/openvpn/

while true; do
  echo "Current IP: ${previousip}"
  echo ""
  #REMOVE OR ADD BELOW AS APPROPRIATE
  echo "Input '1' for 1st."
  echo "Input '2' for 2nd."
  echo ""
  printf "Choice: "
  read input
  # set the value of INPUT here
  if [[ $input == "1" ]]; then
          clear
          echo "1st selected"
          echo ""
          sudo openvpn --config YOUR-1ST-OPEN-VPN-CONFIG.ovpn --daemon #<<CHANGE TO NAME OF .ovpn CONFIG WITHIN '/etc/openvpn/'
  #<<REMOVE OR ADD BELOW AS APPROPRIATE>>
  elif [[ $input == "2" ]]; then
          clear
          echo "2nd selected"
          echo ""
          sudo openvpn --config YOUR-2ND-OPEN-VPN-CONFIG.ovpn --daemon #<<CHANGE TO NAME OF .ovpn CONFIG WITHIN '/etc/openvpn/'
  else
          clear
          echo "Choose ONLY 1 or 2"
          sleep 2
          clear
          continue
  fi
  break
done

echo "Please wait..."
echo ""

sleep 10
clear

currentip="$(wget -O - -q icanhazip.com)"

#<<DELETE OPTION 1 or 2 Below Depending on Desired Configuration >>

#<<OPTION 1 = Target VPN External IP Known (REMOVE '#' from start of the below lines to enable)>>
#echo "${previousip} - Your Previous IP"
#echo ""
#echo "Please ensure the following ip addresses match:"
#echo ""
#echo "127.0.0.1 - VPN DESIRED IP" # <<CHANGE THIS TO YOUR DESIRED IP ONCE CONNECTED>>
#echo "${currentip} - Current External IP"
#echo ""
#echo "If the above IP addresses do not match, there was an issue with the VPN connection"
#echo ""
#echo "Try manually connecting and ensuring DNS is resolving"
#echo ""

#<<OPTION 2 = Target VPN Unknown (REMOVE '#' from start of the below lines to enable)>>
#echo "${previousip} - Your Previous IP"
#echo "${currentip} - Current External IP"
#echo ""
#echo "If the above IP addresses match, the VPN connection failed"
#echo ""
#echo "Try manually connecting and ensuring DNS is resolving"
#echo ""

sleep 5

echo "To stop ovpn, use the following command:"
echo "sudo killall openvpn"
echo ""
echo "It is now safe to close this terminal window"
echo ""

sleep 5
exit
