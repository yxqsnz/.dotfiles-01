CMD="trayer --margin 1 --padding 10 --expand true --edge top --widthtype request --height 30 --SetDockType false --distancefrom top  --distance 30 --alpha 10 --align right  --transparent true --expand true --tint 0x44475a"
pgrep -x trayer >/dev/null && pkill trayer || $CMD &