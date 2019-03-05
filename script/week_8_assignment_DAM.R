library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)

#download data
am_riv <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/2015_NFA_solinst_08_05.csv", skip = 13)

# Make a datetime column by using paste to combine the date and time columns; remember to convert it to a datetime!

am_riv_datetime <- paste(am_riv$Date, " ", am_riv$Time, sep = "")

am_riv2 <- mutate(am_riv, DateTime = am_riv_datetime)

am_riv2$DateTime <- ymd_hms(am_riv2$DateTime) #making the new column a datetime datatype


# Calculate the weekly mean, max, and min water temperatures and plot as a point plot (all on the same graph)

am_riv3 <- am_riv2 %>%
  mutate(which_week = week(DateTime)) %>% 
  group_by(which_week) %>% 
  summarise(mean_temp = mean(Temperature), max_temp = max(Temperature), min_temp = min(Temperature))


am_riv3 %>% 
  ggplot(aes(x = which_week, y = Temperature, color = variable)) +
  geom_point(aes(y = mean_temp, col = "mean_temp"), size = 3) +
  geom_point(aes(y = min_temp, col = "min_temp"), size = 3) +
  geom_point(aes(y = max_temp, col = "max_temp"), size = 3)
  
# Calculate the hourly mean Level for April through June and make a line plot (y axis should be the hourly mean level, x axis should be datetime)

am_riv4 <- am_riv2 %>%
  mutate(which_month = month(DateTime), which_hour = hour(DateTime)) %>% 
  filter((which_month == 4 | which_month == 5 | which_month == 6)) %>% 
  group_by(which_hour, which_month, DateTime) %>% 
  summarize(hr_mean_level = mean(Level))

am_riv4 %>% 
  ggplot()+
  geom_line(aes(x = DateTime, y = hr_mean_level), color = "purple")

# Use the mloa_2001 data set (if you don’t have it, download the .rda file from the resources tab on the website). Remeber to remove the NAs (-99 and -999) and to create a datetime column (we did this in class).

load("data/mauna_loa_met_2001_minute.rda")

mloa_2001$datetime <- paste0(mloa_2001$year, "-", mloa_2001$month, "-", mloa_2001$day, " ", mloa_2001$hour24, ":", mloa_2001$min)

mloa_2001$datetime <- ymd_hm(mloa_2001$datetime)

glimpse(mloa_2001)

mloa_2001_2 <- mloa_2001 %>%
  filter(temp_C_2m != -99, temp_C_2m != -999)

# Then, write a function called plot_temp that returns a graph of the temp_C_2m for a single month. The x-axis of the graph should be pulled from a datetime column (so if your data set does not already have a datetime column, you’ll need to create one!)

plot_temp <- function(mloa_month, data_set = mloa_2001_2){
  mloa_2001_3 <- filter(data_set, month == mloa_month)
  plot <- mloa_2001_3 %>% 
    ggplot()+ 
    geom_line(aes(x=datetime, y = temp_C_2m), color = "blue")+
    theme_classic()
    return(plot)
}  

# plot January only
plot_temp(1)  
 
  
  
  
  
  




