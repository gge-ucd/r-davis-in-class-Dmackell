#### Interation ####
library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)


# sapply(list, function) 
#the first argument is the data you want to interate ACROSS, and the seconde argument is the function you want to APPLY to each thing

sapply(1:10, sqrt)

# for loop first

result <- rep(NA, 10)

for (i in 1:10) {
  result[i] <- sqrt(i) / 2
}

result

# now to use sapply
results_apply <- sapply(1:10, function(x) sqrt(x) / 2)
results_apply


# additional arguments in apply
mtcars_na <- mtcars
mtcars_na[1, 1:4] <- NA

sapply(mtcars_na, mean) # didn't give us mean for mpg cyl disp and hp because they were NA
sapply(mtcars_na, mean, na.rm = T) # na.rm = T allowed us to get the mean for columns with NA's

# back to the tidyverse
mtcars %>%
  map(mean)

mtcars %>% 
  map_dbl(mean)

# map2_ for two sets of inputs

map2_chr(rownames(mtcars), mtcars$mpg, function(x,y) paste(x, "gets", y, "miles per gallon"))


# complete workflow
# attempt to scale our weights of mtcars

(mtcars$wt[1] - min(mtcars$wt)) / (max(mtcars$wt) - min(mtcars$wt))

# generalize

(x - min(x)) / (max(x) - min(x))

# make that into a function
rescale_01 <- function(x){
  (x - min(x)) / (max(x) - min(x))
}

rescale_01(mtcars$wt)

# iterating!
map_df(mtcars, rescale_01)














