#!/bin/bash

grep -v 'exit 0' /etc/rc.local > /tmp/rc.local
echo 'echo 0 > /sys/class/graphics/fbcon/cursor_blink' >> /tmp/rc.local
echo 'exit 0' >> /tmp/rc.local
mv /tmp/rc.local /etc/rc.local
chmod ugo+x /etc/rc.local
