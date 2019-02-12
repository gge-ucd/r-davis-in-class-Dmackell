library(tidyverse)

surveys <- read_csv('data/portal_data_joined.csv')

# Using tidyverse functions and pipes, subset to keep all the rows where weight is between 30 and 60, then print the first few (maybe… 6?) rows of the resulting tibble.

surveys2 <- filter(surveys, weight >30, weight <60)
head(surveys2)

# Make a tibble that shows the max (hint hint) weight for each species+sex combination, and name it biggest_critters. Use the arrange function to look at the biggest and smallest critters in the tibble (use ?, tab-complete, or Google if you need help with arrange).

biggest_critters <- surveys %>% 
  group_by(species, sex) %>% 
  summarise(max_weight = max(weight, na.rm = TRUE)) %>%
  arrange(desc(max_weight))

# Try to figure out where the NA weights are concentrated in the data- is there a particular species, taxa, plot, or whatever, where there are lots of NA values? There isn’t necessarily a right or wrong answer here, but manipulate surveys a few different ways to explore this. Maybe use tally and arrange here. 

# by species
naWeights_species <- surveys %>% 
  group_by(species) %>% 
  tally(is.na(weight))

# by year
naWeights_year <- surveys %>% 
  group_by(year) %>% 
  tally(is.na(weight))


### NA weights seem to be concentrated in the harrisi species. The species has 437 NA's which is by far the most out of any of the speices.

# Take surveys, remove the rows where weight is NA and add a column that contains the average weight of each species+sex combination. Then get rid of all the columns except for species, sex, weight, and your new average weight column. Save this tibble as surveys_avg_weight. The resulting tibble should have 32,283 rows.

surveys_avg_weight <- surveys %>% 
  filter(!is.na(weight)) %>%
  group_by(species, sex) %>%
  mutate(avg_weight = mean(weight)) %>% 
  select(species, sex, weight, avg_weight)

# Challenge: Take surveys_avg_weight and add a new column called above_average that contains logical values stating whether or not a row’s weight is above average for its species+sex combination (recall the new column we made for this tibble).

surveys_above_average_weight <- surveys_avg_weight %>%
  mutate(above_average = weight > avg_weight)

# Extra Challenge: Figure out what the scale function does, and add a column to surveys that has the scaled weight, by species. Then sort by this column and look at the relative biggest and smallest individuals. Do any of them stand out as particularly big or small?

scl_weight <- surveys %>%
  group_by(species) %>% 
  mutate(scaled_weight = scale(weight, center = TRUE, scale = TRUE)) %>%
  arrange(desc(scaled_weight))

# not sure I did this last part right. 
# scale_weight appears to be the (weight - mean_weght) / sd(weight).  
# the individuals with the smallest scaled_weight look to, on average, have relatively small weights. 


