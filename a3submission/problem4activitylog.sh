#! /bin/bash
awk 'BEGIN {FS = ","}
	/(start work,)/ {start_work=$3}
	/(end work,)/ {end_work=$3; time_work+=(end_work-start_work); work++}
	/(start farmers market,)/ {start_farmers_market=$3}
	/(end farmers market,)/ {end_farmers_market=$3; time_farmers_market+=(end_farmers_market-start_farmers_market); farmers_market++}
	/(start run,)/ {start_run=$3}
	/(end run,)/ {end_run=$3; time_run+=(end_run-start_run); run++}
END {print "Work hours: " (time_work) "\nHappened: " work " times\n\nFarmers Market hours: " (time_farmers_market) "\nHappened: " farmers_market " times\n\nRun hours: " (time_run) "\nHappened: " run " times." }
' activity_log.csv
