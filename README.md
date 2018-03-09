# hexagel
shell script for temperature to MQTT

dtparam=i2c_arm=one,spi=on

Sdcard.img -> commun

i2c-tools (afficheur ou capteur)
spi-tools (afficheur)
pcsensor -> à modifier !!! (watever we use mpl115a2)
mosquitto_pub && mosquitto_sub

1. Faire fonctionner le test à la main

2. Ajouter le démarrage auto du script si reboot de la carte

3. Créer le def config pour produire l'image finale
