#!/usr/bin/env bash
while true
  do
    tempA=$(mpl115a2 -a)
    temp=$(mpl115a2)
    date=$(date)

    echo -n -e "\x76\x77\x02$tempA" | spi-pipe -d /dev/spidev0.0

    mosquitto_pub -h 192.168.2.1 -t topic -m "$temp $date"
    sleep 1
done
