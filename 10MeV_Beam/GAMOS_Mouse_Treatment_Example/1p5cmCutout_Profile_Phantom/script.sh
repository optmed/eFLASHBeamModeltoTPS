#!/bin/bash
source source /home/gamos/gamos/GAMOS.6.1.0/config/confgamos.sh
sh sendjobs 1000 100000 50 0 &
sh sendjobs 1001 100000 50 1 &
sh sendjobs 1002 100000 50 2 &
sh sendjobs 1003 100000 50 3 &
sh sendjobs 1004 100000 50 4 &
sh sendjobs 1005 100000 50 5 &
sh sendjobs 1006 100000 50 6 &
sh sendjobs 1007 100000 50 7 &
sh sendjobs 1008 100000 50 8 &
sh sendjobs 1009 100000 50 9
