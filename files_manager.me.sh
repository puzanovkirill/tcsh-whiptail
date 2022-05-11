#!/bin/tcsh

set files = ()

@ i =0 
foreach file (`ls . | grep .my`)
	@ i++  
	set files = ($files $i $file)
end

@ chosenFile = `(whiptail --title "Files manager" --menu "Choose file" --ok-button "Choose" --cancel-button "Exit" \
	15 60 4  $files > /dev/tty) >& /dev/stdout` * 2

if($? == 0) then
	echo "${files[$chosenFile]}"
	tcsh ./file_controller.me.sh "${files[$chosenFile]}"
else 
	set allScripts = ()
	foreach scrpt (`pgrep -fl .me.sh`)
		set allScripts = ($allScripts $scrpt)
	end
	clear
	@ counter = 1
	foreach scrpt ($allScripts)
		kill -9 "${allScripts[$counter]}"
		@ counter = $counter + 2
	end
	exit
endif
