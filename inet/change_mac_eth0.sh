#!/bin/bash
#
ifconfig eth0 down
ifconfig eth0 hw ether 00:22:33:44:55:6f
ifconfig eth0 up
