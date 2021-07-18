
# Import data to calculate the standard deviation of the chips ev results from my spins database.
# Using Poker Tracker 4

# I added both files, original and modified
# Changes in the original files:
# Original csv file writes "1,000" (one thousand) instead of "1000" and added some wrong data that I erased.
# Changed buy in format from "$6.51+$0.49" to "7"
# Changed the Site name to 'Sportium', 'PS.es', 'PS.com'
# Erased torunament ID column

# Path to the files
path <- "D:/Poker/01_Spins/02_Spins_Analisis desviacion tipica chips ev/"

# File names
file_Sportium <- 'ReportExport_Sportium_modified.csv'
file_PS_es <- 'ReportExport_PS_es_modified.csv'
file_PS_com <- 'ReportExport_PS_com_modified.csv'

file_Sportium <- paste(path, file_Sportium, sep = '')
file_PS_es <- paste(path, file_PS_es, sep = '')
file_PS_com <- paste(path, file_PS_com, sep = '')

# Import
results_Sportium <- read.csv(file_Sportium, head=T, sep=",", dec=".")
results_PS_es <- read.csv(file_PS_es, head=T, sep=",", dec=".")
results_PS_com <- read.csv(file_PS_com, head=T, sep=",", dec=".")

# Uncomment to see which stakes
# unique(results_Sportium[,2])
# unique(results_PS_es[,2])
# unique(results_PS_com[,2])

# Standard deviation of chips won
# st_dev_Chips(T, T, T, 10, 50)
# include_Sportium = T; include_PS_es = T; include_PS_com = T; min_stake = 5; max_stake = 50
st_dev_Chips <- function(include_Sportium, include_PS_es, include_PS_com, min_stake, max_stake) {
	results = NULL
	
	cond1 <- (results_Sportium[, 2] >= min_stake) & (results_Sportium[, 2] <= max_stake)
	cond2 <- (results_PS_es[, 2] >= min_stake) & (results_PS_es[, 2] <= max_stake)
	cond3 <- (results_PS_com[, 2] >= min_stake) & (results_PS_com[, 2] <= max_stake)

	results1 <- results_Sportium[cond1, ][, 8]
	results2 <- results_PS_es[cond2, ][, 8]
	results3 <- results_PS_com[cond3, ][, 8]

	if (include_Sportium == TRUE) {results <- c(results, results1)}
	if (include_PS_es == TRUE) {results <- c(results, results2)}
	if (include_PS_com == TRUE) {results <- c(results, results3)}
	
	return(sd(results))
	
}

# Standard deviation of chips EV
# st_dev_ChipsEV(T, T, T, 10, 50)
# include_Sportium = T; include_PS_es = T; include_PS_com = T; min_stake = 5; max_stake = 50
st_dev_ChipsEV <- function(include_Sportium, include_PS_es, include_PS_com, min_stake, max_stake) {
	results = NULL
	
	cond1 <- (results_Sportium[, 2] >= min_stake) & (results_Sportium[, 2] <= max_stake)
	cond2 <- (results_PS_es[, 2] >= min_stake) & (results_PS_es[, 2] <= max_stake)
	cond3 <- (results_PS_com[, 2] >= min_stake) & (results_PS_com[, 2] <= max_stake)

	results1 <- results_Sportium[cond1, ][, 7]
	results2 <- results_PS_es[cond2, ][, 7]
	results3 <- results_PS_com[cond3, ][, 7]

	if (include_Sportium == TRUE) {results <- c(results, results1)}
	if (include_PS_es == TRUE) {results <- c(results, results2)}
	if (include_PS_com == TRUE) {results <- c(results, results3)}
	
	return(sd(results))
	
}

