# GetAlexaTop500

This script gets 


1- Global Top 2500 sites from Alexa

  /ParseAlexa.sh
  
2- Country based 500 hundred sites from Alexa - Top 500 Hundred Turkis Sites in this case

  /AlexaTop500Country.php

3- Category based 2000 sites from Alexa - Shopping, Games, Kids_and_Teens, Arts

  /AlexaTopCategories.php


You can change these and their numbers from within the corresponding files.
If you run ParseAlexa.sh it runs all necessary commands, combines them. Cleans them. Then sends it to local dnsmasq in order to let it cache all those.
