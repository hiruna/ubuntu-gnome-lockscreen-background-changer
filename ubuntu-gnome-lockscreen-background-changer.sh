#!/bin/bash

#title: ubuntu-gnome-lockscreen-background-changer.sh
#description: Changes the default dark purple color from lock screen
#author: Hiruna Wijesinghe https://github.com/hiruna/ubuntu-gnome-lockscreen-background-changer
#date: 21/10/2017

#change the value to the hex color code you like
color=#424242

#change the file path to the background image you wish to use
image='/home/hiruna/Pictures/Awesome_Bridge_11658x6112.jpg'

#change to true if you want to reset back to stock
reset=true

#ubuntu.css location - DO NOT CHANGE
csslocation='/usr/share/gnome-shell/theme/ubuntu.css'
#backup location - DO NOT CHANGE
cssbaklocation='/usr/share/gnome-shell/theme/ubuntu.css.old'

#Exit if any line fails
set -e

#if backup of ubuntu.css doesn't exist, create it
if [ ! -e ${cssbaklocation} ] ; then
cp ${csslocation} ${cssbaklocation}
fi

#copy contents of backup file to original
cp ${cssbaklocation} ${csslocation}

if [ ! reset ] ; then
#change color and background image as specified by user
sed -i "/background: #2c001e url(resource:\/\/\/org\/gnome\/shell\/theme\/noise-texture.png);/c\background: $color url(\"$image\");}" ${csslocation}
sed -i '/background-repeat: repeat; }/c\ ' ${csslocation}
fi

