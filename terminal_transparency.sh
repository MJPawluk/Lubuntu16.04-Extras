#!/bin/bash
echo "Do you want to have real transparency for LXTerminal?"

read -r -p "y/n: " answer

if [ "$answer" == "y" ]
  then
    sudo apt-get install compton
    cd /
    cd /home/$USER/.\config

    cat > compton.config <<EOF
    opacity-rule = ["85:class_g = 'lxterminal'"];
EOF
compton -b

sleep 2

echo "Now lxterminal will become transparent if you change the transparency of the backround-colour in settings. "
sleep 2

echo "Have a nice day!"

cd lxsession/Lubuntu
cat >> autostart <<EOF
compton -b
EOF
fi
