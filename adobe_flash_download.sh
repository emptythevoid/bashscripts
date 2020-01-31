#!/bin/bash

# Downloads the most current .msi of adobe flash player

logfile=download_log
fplayer_mainlink='https://fpdownload.macromedia.com/pub/flashplayer/pdc/'
fplayer_version=`curl --silent 'https://get.adobe.com/de/flashplayer/about/' | grep -Eo '[0-9]{2}\.[0-9]\.[0-9]\.[0-9]{3}' | sort -uV | tail -1`
fplayer_main=`echo $fplayer_version | cut -c1-2`
f_activex='install_flash_player_'$fplayer_main'_active_x.msi'
f_plugin='install_flash_player_'$fplayer_main'_plugin.msi'
f_ppapi='install_flash_player_'$fplayer_main'_ppapi.msi'

echo Download Flashplayer ActiveX $fplayer_version >>$logfile
echo --------------------- >>$logfile
wget -nv -a $logfile -nc -P flashplayer_$fplayer_version $fplayer_mainlink$fplayer_version/$f_activex


