#!/bin/tcsh

@ chosenOption = `(whiptail --title "Control $1 file" --menu "Choose option" --ok-button "Choose" --cancel-button "Back" \
    15 60 4 \
    "1" "Read file" \
    "2" "Rename file" \
    "3" "Delete file" > /dev/tty) >& /dev/stdout`

echo "choosen $chosenOption"

switch ($chosenOption)
	case 1:
	tcsh ./read_file.me.sh $1
	breaksw
	case 2:
	tcsh ./rename_file.me.sh $1
	breaksw
	case 3:
	tcsh ./delete_file.me.sh $1
	breaksw
	default:
	breaksw
endsw
if($? == 0) then
	tcsh ./files_manager.me.sh
endif
