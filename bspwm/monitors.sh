MONITORS=$(bspc query -M --names | wc -l)

if [[ $MONITORS > 1 ]]; then 
	bspc monitor eDP-1 -d I II III IV V 
	bspc monitor HDMI-1 -d VI VII VIII IX X 
else 
    bspc monitor eDP-1 -d I II III IV V VI VII VIII IX X
fi 
