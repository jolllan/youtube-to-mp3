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

echo "###########################################"
echo ""
echo "Bienvenue, avec ce programme vous pouvez télécharger la musique de votre choix en mp3 (les playlists fonctionnent aussi)"
echo ""

# Vérifie si l'exécutable existe
if [ -e $file ]
then
    echo ""
else
    echo "Je ne trouve pas le fichier 'yt-dlp_linux_aarch64' voulez vous que je le télécharge ? Y or N"
    read -p "  > " condition
    
    # Télécharge ou non yt-dlp
    if [ $condition == "Y" ]
    then
        wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_linux_aarch64
    else
    echo "bah ciao alors"
    exit
    fi
fi



if [[ -x "$file" ]]
then
    echo ""
else
    echo "Le programme '$file' à besoin d'être exécutable voulez vous le faire par ce script ? Y or N"
    read -p "  > " consent
    if [ $consent == "Y" ]
    then 
        sudo chmod +x $file
    else 
    echo "Erreur, le fichier doit pouvoir être éxécuter"
    exit
    fi
fi



echo  "Entrez l'url"
read -p "  > " url
echo "####"
echo "Téléchargement en cours..."
./$file -f 'ba' $url -x --audio-format mp3 
echo "Bye bye"