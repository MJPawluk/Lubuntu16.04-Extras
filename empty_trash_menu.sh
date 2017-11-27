#!/bin/bash
echo "This script enables the \"empty-trash\" selection on right-clicking on the desktop trash icon. Do you want to proceed?"

read -r -p "y/n: " eingabe


if [ "$eingabe" == "y" ]
  then
  sudo apt-get install trash-cli

  cd /

  cd /home/$USER/.\local/share

  mkdir file-manager

  cd file-manager

  mkdir actions

  cd actions

    cat > empty_trash.desktop <<EOF

    [Desktop Entry]
    Type=Action
    Name=Empty Trash
    Name[de]=Papierkorb leeren
    Icon=user-trash

    Profiles=on_trash;

    [X-Action-Profile on_trash]
    MimeTypes=inode/directory;
    Basenames=trash:///
    Exec=/usr/bin/trash-empty
    Name=clear user trash folder
EOF

echo "To apply the changes to the system, a reboot is aquired. Do you want to reboot now?"

read -p "y/n?: " antwort

if [ "$antwort" == "y" ]
then
reboot
else
echo "The changes will become active with the next reboot. Bye!"
sleep 5
fi
fi
