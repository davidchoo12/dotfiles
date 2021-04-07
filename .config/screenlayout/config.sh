#!/bin/bash

# src: https://faq.i3wm.org/question/5312/how-to-toggle-onoff-external-and-internal-monitors.1.html

EXTERNAL_OUTPUT="HDMI1"
EXTERNAL_OUTPUT_SIZE="1920x1080"
INTERNAL_OUTPUT="eDP1"
INTERNAL_OUTPUT_SIZE="1366x768"
INTERNAL_OUTPUT_POS="277x1080"
# cycle order, default to first mode
MODES_SEQUENCE=("INTERNAL" "DUPLICATE" "EXTEND" "EXTERNAL")

# if we don't have a file, assume current mode is last mode so that next mode is first mode
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  curr_mode="EXTERNAL"

# otherwise read the value from the file
else
  curr_mode=`cat /tmp/monitor_mode.dat`
fi

# find index of curr mode
for i in "${!MODES_SEQUENCE[@]}"; do
  [[ "${MODES_SEQUENCE[$i]}" = "$curr_mode" ]] && break
done

# get next mode
next_mode=${MODES_SEQUENCE[($i+1)%4]}

# update monitor to next mode
if [ $next_mode = "INTERNAL" ]; then
  xrandr --output $INTERNAL_OUTPUT --auto \
    --output $EXTERNAL_OUTPUT --off
  pactl set-default-sink 1 && $refresh_i3status
  curr_mode="INTERNAL"
elif [ $next_mode = "DUPLICATE" ]; then
  xrandr --output $INTERNAL_OUTPUT --auto \
    --output $EXTERNAL_OUTPUT --auto --scale-from $INTERNAL_OUTPUT_SIZE --same-as $INTERNAL_OUTPUT
  pactl set-default-sink 0 && $refresh_i3status
  curr_mode="DUPLICATE"
elif [ $next_mode = "EXTEND" ]; then
  xrandr --output $INTERNAL_OUTPUT --auto --pos $INTERNAL_OUTPUT_POS\
    --output $EXTERNAL_OUTPUT --auto --scale-from $EXTERNAL_OUTPUT_SIZE
  pactl set-default-sink 0 && $refresh_i3status
  curr_mode="EXTEND"
elif [ $next_mode = "EXTERNAL" ]; then
  xrandr --output $INTERNAL_OUTPUT --off \
    --output $EXTERNAL_OUTPUT --auto
  pactl set-default-sink 0 && $refresh_i3status
  curr_mode="EXTERNAL"
fi


# if [ $monitor_mode = "EXTEND" ]; then
#         monitor_mode="EXTERNAL"
#         xrandr --output $INTERNAL_OUTPUT --off \
#           --output $EXTERNAL_OUTPUT --auto
#         pactl set-default-sink 0 && $refresh_i3status
# elif [ $monitor_mode = "EXTERNAL" ]; then
#         monitor_mode="INTERNAL"
#         xrandr --output $INTERNAL_OUTPUT --auto \
#           --output $EXTERNAL_OUTPUT --off
#         pactl set-default-sink 1 && $refresh_i3status
# elif [ $monitor_mode = "INTERNAL" ]; then
#         monitor_mode="DUPLICATE"
#         xrandr --output $INTERNAL_OUTPUT --auto \
#           --output $EXTERNAL_OUTPUT --auto --scale-from $INTERNAL_OUTPUT_SIZE --same-as $INTERNAL_OUTPUT
#         pactl set-default-sink 0 && $refresh_i3status
# else
#         monitor_mode="EXTEND"
#         xrandr --output $EXTERNAL_OUTPUT --auto --scale-from $EXTERNAL_OUTPUT_SIZE\
#           --output $INTERNAL_OUTPUT --auto --pos $INTERNAL_OUTPUT_POS
#         pactl set-default-sink 0 && $refresh_i3status
# fi
echo $curr_mode
echo $curr_mode > /tmp/monitor_mode.dat
