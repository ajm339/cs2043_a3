#! /bin/bash
gawk 'BEGIN {print "Start"}
	/work/ {work++}
	/farmers market/ {farmers_market++}
	/run/ {run++}
END {print "Work: " work ", Farmers Market: " farmers_market ", Run: " run "." }
' activity_log.csv