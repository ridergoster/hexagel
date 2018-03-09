#!/usr/bin/env bash
serverName="192.168.2.1"
topicName="temperature_esgi"

while true
  do
    temp=$(mpl115a2 | cut -d " " -f5)
    tempA=$(echo $temp | tr -d ".")
    date=$(date +"%y:%m:%d:%H:%M:%S")
    message="$temp°C - $date"

    echo -n -e "\x76\x77\x02$tempA" | spi-pipe -d /dev/spidev0.0

    echo $message

    mosquitto_pub -h $serverName -t $topicName -m $message
    sleep 1
done
