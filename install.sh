#! /bin/bash

#for using arduino ide, you have to give the usb port permission

ls -l /dev/ttyUSB*

sudo usermod -a -G dialout <username>

