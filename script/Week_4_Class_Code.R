# Week 4

# Intro to Dataframes

download.file(url = "https://ndownloader.figshare.com/files/2292169", destfile = "data/portal_data_joined.csv")

surveys <- read.csv(file = "data/portal_data_joined.csv")

head(surveys)


# Let's look at structure

str(surveys)

dim(surveys)

nrow(surveys)

ncol(surveys)

tail(surveys)

names(surveys)

rownames(surveys)

summary(surveys)

# subsetting dataframes

animal_vec <- c("mouse", "rat", "cat")

animal_vec[2]

# Dataframes are 2D!

surveys[1,1]
surveys[2,1]
surveys[33000,1]

# Whole first column - just leave the row blank in subset

surveys[,1]

# using a single number with no comma, will give us a dataframe with one column
surveys[1]

head(surveys[1])

# Pull out the first 3 values in the 6th column
surveys[1:3,6]

animal_vec[c(1,3)]

# pull out a whole single observation

surveys[5,]

# negative sign to exclude indices
surveys[1:5,-1]

surveys[-c(10:34786),]

surveys[c(10, 15, 20),]

# More ways to subset

surveys["plot_id"] # single column as data.frame

surveys[,"plot_id"] # single column as vector

surveys[["plot_id"]] # single column as vector, we'll come back to using double brackets with lists

surveys$year # single column as vector

# Challenge

surveys_200 <- data.frame(surveys[200,])
surveys[nrow(surveys),]
tail(surveys)
surveys_last <- surveys[nrow(surveys),]
surveys_middle <- surveys[nrow(surveys)/2,]
surveys[-c(7:nrow(surveys)),]

# Factors

# creating our own vector

sex <- factor(c("male", "female", "female", "male"))
sex
class(sex)
typeof(sex)

#levels gives back a character vector of the levels
levels(sex)
levels(surveys$genus)
nlevels(sex)

concentration <- factor(c("high", "medium", "high", "low"))
concentration

concentration <- factor(concentration, levels = c("low", "medium", "high"))
concentration

# let's try adding to a factor

concentration <- c(concentration, "very high")
concentration

# above coerces to characters if you add a value that doesn't match a current level

# let's just make em characters
as.character(sex)

# factors with numeric levels
year_factor <- factor(c(1990, 1923, 1965, 2018))
as.numeric(year_factor)
as.character(year_factor)

# This will actually give us a numeric vector
as.numeric(as.character(year_factor))

# Why so many factors in surveys

string_as_no_factors <- read.csv(file = "data/portal_data_joined.csv", stringsAsFactors = FALSE)
str(string_as_no_factors)

as.numeric(levels(year_factor))[year_factor]
year_factor

# renaming factors
sex <- surveys$sex
levels(sex)
levels(sex)[1] <- "undetermined"
levels(sex)

# Working with dates
library(lubridate)
my_date <- ymd("2015-01-01")
my_date
str(my_date)
my_date <- ymd(paste("2015", "05", "17", sep = "-"))
my_date

paste(surveys$year, surveys$month, surveys$day, sep = "-")
surveys$date <- ymd(paste(surveys$year,surveys$month, surveys$day, sep = "="))
surveys$date
surveys$date(is.na(surveys$date))
