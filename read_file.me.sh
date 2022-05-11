#!/bin/tcsh

whiptail --scrolltext --title "Reading $1 file" --textbox $1 --ok-button "Back" 10 30

if($? == 0) then
	tcsh ./file_controller.me.sh $1
endif
