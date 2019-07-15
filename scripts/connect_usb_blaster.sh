#!/bin/bash
sudo killall -9 jtagd
sudo /home/m4j0rt0m/intelFPGA_lite/18.1/quartus/bin/jtagd
sudo /home/m4j0rt0m/intelFPGA_lite/18.1/quartus/bin/jtagconfig
echo -n "Press [ENTER] to continue,...: "
read var_name
echo "You can go on!...."
