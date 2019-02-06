#### Week 5 in class

# install tidyverse
install.packages("tidyverse")

library(tidyverse)
library(dplyr)

surveys <- read_csv("data/portal_data_joined.csv")

str(surveys)

# Play with some functions from dplyr

# Select is used for columns in a data frame

select(surveys, plot_id, species_id, weight)

# Filter is used to filter rows

filter(surveys, year == 1995)

surveys2 <- filter(surveys, weight <5)

surveys_sml <- select(surveys2, species_id, sex, weight)

# Pipes %>%  on a PC is control-shift-m
# Pipe takes all the informantion from the left and shift it to the right, see below. Can think of a pipe as the word "then". 

surveys %>% 
  filter(weight < 5) %>% 
  select(species_id, sex, weight)

# Challenge! Subset surveys to include individuals collected before 1995 and retain only the columns year, sex, weight.

surveys %>% 
  filter(year < 1995) %>% 
  select(year, sex, weight)

# mutate is used to create new columns

surveys <- surveys %>% 
  mutate(weight_kg = weight / 1000) %>% 
  mutate(weight_kg2 = weight_kg * 2)

surveys %>% 
  mutate(weight_kg = weight / 1000) %>% 
  mutate(weight_kg2 = weight_kg * 2)

surveys %>% 
  filter(!is.na(weight)) %>% # This line filters out NAs in the weight column
  mutate(weight_kg = weight/1000) %>% 
  

# Challenge - Create a new data frame from the surveys data that meets the following criteria: contains only the  species_id column and a new column called hindfoot_half containing values that are half the  hindfoot_length values. In this hindfoot_half column, there are no NAs and all values are less than 30. Hint: think about how the commands should be ordered to produce this data frame!

challenge2 <- surveys %>% 
  mutate(hindfoot_half = hindfoot_length/2) %>% 
  filter(!is.na(hindfoot_half)) %>% 
  filter(hindfoot_half < 30) %>% 
  select(species_id, hindfoot_half)

# "complete cases" to filter out all of the NAs

# group_by is good for split-apply-combine

surveys %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE))
  
# You can use group_by with multiple columns

surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(sex, species, species_id) %>% 
  summarize(mean_weigth = mean(weight), min_weight = min(weight)) %>% 
  View

# Tally function

tally_df <- surveys %>% 
  group_by(sex, species_id) %>% 
  tally() 

# tally() is the same as group_by(something) %>% summarise(new_column n = n())

## Gathering and spreading

# Spread 

surveys_gw <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarise(mean_weight = mean(weight))

surveys_spread <- surveys_gw %>% 
  spread(key = genus, value = mean_weight)

surveys_gw %>% 
  spread(genus, mean_weight, fill = 0) %>% View

# Gathering

surveys_gather <- surveys_spread %>% 
  gather(key = genus, value = mean_weight, -plot_id)






