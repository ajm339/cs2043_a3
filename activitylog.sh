#! /bin/bash
gawk 'BEGIN {FS = ","}
	/work/ {work++}
	/(start work,)/ {start_work+=$3}
	/(end work,)/ {end_work+=$3}
	/(farmers market)/ {farmers_market++}
	/(start farmers market,)/ {start_farmers_market+=$3}
	/(end farmers market,)/ {end_farmers_market+=$3}
	/run/ {run++}
	/(start run,)/ {start_run+=$3}
	/(end run,)/ {end_run+=$3}
END {print "Work: " (start_work) ", happened: " work " times, Farmers Market: " (end_farmers_market) " happened: " farmers_market " times, Run: " (end_run-start_run) " happened: " run " times." }
' activity_log.csv