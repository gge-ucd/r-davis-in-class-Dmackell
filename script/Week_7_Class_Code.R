# Week 7 Class Code

# how to install packages from Github
# to do this you need to have the devtools package installed
install.packages("devtools")

# You can find the author and title of package you want on the github website. example below
devtools::install_github('thomasp85/patchwork')

read.csv("data/wide_eg.csv")

library(tidyverse)

# Using skip
# sometimes there is a gap between your data and the first cell in csv, in this case use skip = 2 becuause the data starts on the third row
wide_data <- read.csv("data/wide_eg.csv", skip = 2)

# read_delim can be used instead of read_csv but useful if getting data from people in other countries that use different punctuation 

# load in a file that contains a single r object
load("data/mauna_loa_met_2001_minute.rda")

# to save a file as RDS
saveRDS(wide_data, "data/wide_data.rds")

# remove data from directory
rm(wide_data)

#read wide data into your environment
wide_data_rds <- readRDS('data/wide_data.rds')

# Use saveRDS() and readRDS() for .rds files, and we use save() and load() for .rda file

# Other Packages
# Use readxl, googlesheets, and googledrive to read those file types. 
# forein package can be used to read in other file types (search through the forein package)
# rio::import('filename') also useful to read other stuff

#### Using Lubridate=========================================
# Useful for date time stuff
library(lubridate)

# Dates good for just dates
# PoSIXct good for calendr time, best class for dates with time
# PoSIXlt good for local time

# Date class can be easily manipulated and converted in r

sample_dates1 <- c("2016-02-01", "2016-03-17", "2017-01-01")
# right now this is stored as a character. 
# to convert to date use:
as.Date(sample_dates1) # uses YYYY MM DD format

# if your dates are not in this format you can tell your computer what they are by including the arguemnet "format"

sample_dates2 <- c("02-01-2001", "04-04-1991")
as.Date(sample_dates2, format = '%m-%d-%y')

as.Date("Jul 04, 2017", format = "%b%d,%Y")

# Date Calculations

dt1 <- as.Date("2017-07-11")

dt2 <- as.Date("2016-04-22")

dt1

print(dt1 - dt2) # Gives you time difference in days

# time difference in weeks
print(difftime(dt1, dt2, units = "week"))


# show in 2 week intervals for 10 intervals
six.weeks <- seq(dt1, length = 10, by = "2 week")

# using lubridate functions
ymd("2016/01/01")

dmy("04.04.91")

mdy("Feb 19, 2001") # Doesn't even have to be in the same format, it knows


