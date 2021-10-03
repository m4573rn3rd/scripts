#!/bin/bash
# Bash Menu Script Sample
cd /cloud/Scripts
PS3='Please enter your choice: '
options=("Backup Server" "Option 2" "Option 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Backup Server")
            echo "Backing up server"
            say  "Backing up server"
            sudo ./backup.sh
            ;;
        "Option 2")
            echo "you chose choice 2"
            ;;
        "Option 3")
            echo "you chose choice 3"
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done

