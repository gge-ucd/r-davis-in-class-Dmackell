library(lubridate)
library(tidyverse)

load("data/mauna_loa_met_2001_minute.rda")

# two ways to format dates from last lecture
as.Date("02-01-1998", format = "%m-%d-%Y")

mdy("02-01-1998") # this is the shorter way

# POSIXct

tm1 <- as.POSIXct("2016-07-24 23:55:26 PDT")
tm1

tm2 <- as.POSIXct("25072016 08:32:07", format = "%d%m%Y %H:%M:%S")
tm2

tm3 <- as.POSIXct("2010-12-01 11:42:03", tz = "GMT")
tm3

# To specify timezone and format in the same call use strptime
tm4 <- as.POSIXct(strptime("2016/04/04 14:47", format = "%Y/%m/%d %H:%M"), tz = "America/Los_Angeles")

tz(tm4)

#Do the same thing with lubridate
ymd_hm("2016/04/04 14:47", tz = "America/Los_Angeles")

ymd_hms("2016-05-04 22:14:11", tz = "GMT")

nfy <- read_csv("data/2015_NFY_solinst.csv", skip = 12)

nfy2 <- read_csv("data/2015_NFY_solinst.csv", skip = 12, col_types = "ccidd")

glimpse(nfy2)

nfy2$datetime <- paste(nfy2$Date, " ", nfy2$Time, sep = "")

glimpse(nfy2)

nfy2$datetime <- ymd_hms(nfy2$datetime, tz = "America/Los_Angeles")

glimpse(nfy2)

tz(nfy2$datetime)

summary(mloa_2001)

mloa_2001$datetime <- paste0(mloa_2001$year, "-", mloa_2001$month, "-", mloa_2001$day, " ", mloa_2001$hour24, ":", mloa_2001$min)

mloa_2001$datetime <- ymd_hm(mloa_2001$datetime)

glimpse(mloa_2001)

# Challenge with dplyr & ggplot
# Remove the NA’s (-99 and -999) in rel_humid, temp_C_2m, windSpeed_m_s
# Use dplyr to calculate the mean monthly temperature (temp_C_2m) using the datetime column (HINT: look at lubridate functions like month())
# Make a ggplot of the avg monthly temperature
# Make a ggplot of the daily average temperature for July (HINT: try yday() function with some summarize() in dplyr)

mloa_2001_challenge <- mloa_2001 %>% 
  filter(rel_humid != -99, rel_humid != -999) %>% 
  filter(temp_C_2m != -99, temp_C_2m != -999) %>% 
  filter(windSpeed_m_s != -99, windSpeed_m_s != -999)

mloa_3 <- mloa_2001_challenge %>%
  mutate(which_month = month(datetime, label = TRUE)) %>% 
  group_by(which_month) %>% 
  summarise(avg_temp = mean(temp_C_2m))

mloa_3 %>%
  ggplot()+
  geom_point(aes(x = which_month, y = avg_temp), size = 3, color = "blue") +
  geom_line(aes(x = which_month, y = avg_temp, group = 1))
  
#### Moving on into Functions ========

my_sum <- function(a, b){
  the_sum <- a + b
  return(the_sum)
}

my_sum(3, 7)

# Create a function that converts the temp in K to the temp in C (Subtract 273.15)

ftemp <- function(K){
  degC <- K - 273.15
  return(degC)
}

ftemp(100)

v <- c(100, 200, 15) # can input multiple values as a vector 

ftemp(v) # and then input them into the function

#### Iterations ===========

x <- 1:10
log(x)

# For Loops

for (i in 5:10) {
  print(i)
  }


for (i in 1:10) {
  print(i)
  print(i^2)
}

# we can use the "i" value as an index

for (i in 1:10) {
  print(letters[i])
  print(mtcars$wt[i])
}

# Make a results vector ahead of time

results <- rep(NA, 10)

for (i in 1:10) {
  results[i] <- letters[i]
}

results













