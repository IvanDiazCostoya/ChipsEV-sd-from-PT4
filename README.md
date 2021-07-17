# ChipsEV-sd-from-PT4
R script for finding out what's the standard deviation of my chips EV in poker spin&amp;go format.

Import data from Poker Tracker 4 to calculate the standard deviation of the chips ev results from my spins database.

I added both files to the repository, original and modified.

Changes in the original files:
Original csv file writes "1,000" (one thousand) instead of "1000". Changed to "1000".
Erased a few wrong rows.
Changed buy in format from "$6.51+$0.49" to "7".
Changed the Site name to 'Sportium', 'PS.es', 'PS.com'.
Erased torunament ID column.

The results are aproximately 727 for chips won and 438 for chips ev and very consistent throughout different sites.
I will use those for calculations about bankroll management, variance, etc.
