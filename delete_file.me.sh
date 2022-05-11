#!/bin/tcsh

whiptail --title "Delete confirmation" --yesno "You are trying to delete $1 file. Do you want yo delete file?" \
	--defaultno 10 60

if($? == 0) then
	rm $1
	tcsh ./files_manager.me.sh
else
	tcsh ./file_controller.me.sh $1
endif 
