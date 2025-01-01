#!/usr/bin/env bash
xcape -e Super_L='Alt_L|F1' &
picom -b  --config /home/rmcle/.config/picom.conf &
redshift -l 51.572309:0.397208 &
xrandr --output DP-0 --mode 2560x1440 --rate 144.00 &
