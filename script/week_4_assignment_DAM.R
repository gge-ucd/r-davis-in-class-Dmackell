# Read in portal_data_joined.csv

surveys <- read.csv("data/portal_data_joined.csv")

# Subset the first 400 rows and columns 1, 5, 6, 7 , 8

surveys_subset <- surveys[c(1:400), c(1, 5, 6, 7, 8)]

# Subset from surveys_subset rows with a hindfoot length greater than 32

long_feet <- subset(surveys_subset, hindfoot_length > 32)

# Create a data frame of long_feet called surveys_long_feet

surveys_long_feet <- data.frame(long_feet)

# Create a Histogram of hindfoot length from surveys_long_feet

hist(surveys_long_feet[, "hindfoot_length"])

# Change "hindfoot_length" into a character vector.

hindfoot_length_char <- as.character(surveys_long_feet[, "hindfoot_length"])

# Try and make a histogram of hindfoot_length_char

hist(hindfoot_length_char)

# Get an error - Error in hist.default(hindfoot_length_char) : 'x' must be numeric


