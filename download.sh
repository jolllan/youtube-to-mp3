#!/bin/bash

################################
##                            ##
##   Ce programme fonctionne  ##
##   uniquement sur           ##
##   Raspbian OS 64 bits      ##
##                            ##
################################


#####     nécéssite FFMPEG   ######


file=yt-dlp_linux_aarch64


echo "  ____  _           _     "
echo " |  _ \| |      ___| |__  "
echo " | | | | |     / __| '_ \ "
echo " | |_| | |___ _\__ \ | | |"
echo " |____/|_____(_)___/_| |_|"


echo ""
echo "Bienvenue, avec ce programme vous pouvez télécharger la musique de votre choix en mp3 de la meilleure qualité possible(les playlists fonctionnent aussi)"
echo ""

# Vérifie si l'exécutable existe
if [ -e $file ]
then
    echo ""
else
    echo -e "\E[32m Je ne trouve pas le fichier 'yt-dlp_linux_aarch64' voulez vous que je le télécharge ? Y or N \E[0m"
    read -p "  > " condition
    
    # Télécharge ou non yt-dlp
    if [ $condition == "Y" ]
    then
        wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_linux_aarch64
    else
    echo -e "\E[31m Sortie de programme \E[0m"
    exit
    fi
fi



if [[ -x "$file" ]]
then
    echo ""
else
    echo -e "\E[32m Le programme '$file' à besoin d'être exécutable voulez vous le faire par ce script ? Y or N \E[0m"
    read -p "  > " consent
    if [ $consent == "Y" ]
    then 
        sudo chmod +x $file
    else 
    echo -e "\E[31m Erreur, le fichier doit pouvoir être éxécuter \E[0m"
    exit
    fi
fi



echo -e "\E[36m Entrez l'url \E[0m"
read -p "  > " url
echo "####"
printf "Téléchargement en cours"
sleep 0.2
printf "."
sleep 0.2
printf "."
sleep 0.2
echo "."

./$file -f 'ba' $url -x --audio-format mp3 
echo -e "\E[36m Bye bye \E[0m"

exit