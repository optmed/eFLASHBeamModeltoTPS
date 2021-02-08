#!/bin/bash
source source /home/gamos/gamos/GAMOS.6.1.0/config/confgamos.sh
sh sendjobs 1000 10000000 25 0 &
sh sendjobs 1001 10000000 25 1 &
sh sendjobs 1002 10000000 25 2 &
sh sendjobs 1003 10000000 25 3 &
sh sendjobs 1004 10000000 25 4 &
sh sendjobs 1005 10000000 25 5 &
sh sendjobs 1006 10000000 25 6 &
sh sendjobs 1007 10000000 25 7 &
sh sendjobs 1008 10000000 25 8 &
sh sendjobs 1009 10000000 25 9
