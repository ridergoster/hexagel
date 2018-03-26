#!/bin/sh
serverName="192.168.2.1"
topicName="temperature_esgi"

udhcpc 2>/dev/null

while true
  do
    temp=$(mpl115a2 | cut -d " " -f5)
    tempA=$(echo $temp | tr -d ".")
    date=$(date +"%y:%m:%d:%H:%M:%S")
    message="$temp C ~ $date"

    echo -n -e "\x76\x77\x02$tempA" | spi-pipe -d /dev/spidev0.0

    logger $message

    mosquitto_pub -h $serverName -t $topicName -m "$message" 2>/dev/null
    sleep 1
done
