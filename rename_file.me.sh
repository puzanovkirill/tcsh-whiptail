#!/bin/tcsh

set fileName = `(whiptail --title "Renaming $1 file" --inputbox "Enter new file name" \
	--ok-button "Rename" --cancel-button "Cancel" \
	10 60 > /dev/tty) >& /dev/stdout`

if($? == 0) then
	mv $1 $fileName
	tcsh ./file_controller.me.sh $fileName
else 
	tcsh ./file_controller.me.sh $1
endif
		
