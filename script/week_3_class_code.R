read.csv("data/tidy.csv")

x <- 4

# vectors

weight_g <- c(50, 60, 31, 89)
weight_g

# now characters

animals <- c("mouse", "rat", "dog", "cat")
animals

# vector exploration

length(weight_g)
length(animals)

class(weight_g)
class(animals)

# str is my go to first tool for looking at an object
str(x)
str(weight_g)

# be careful about adding values and running this line multiple times
weight_g <- c(weight_g, 105)
weight_g

weight_g <- c(25, weight_g)

# 6 types of atomic vectors: "numeric" ("double"), "character", "logical", "integer", "complex", 
"raw"

# first 4 we listed were the main ones we'll work with

typeof(weight_g)

weight_integer <- c(20L, 21L, 85L)
class(weight_integer)
typeof(weight_integer)

#coercion order characters, numbers, integers, logical

num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

class(num_char)
class(num_char)
class(num_logical)
class(char_logical)
class(tricky)

combined_logical <- c(num_logical, char_logical)

# subsetting vectors
animals
animals[3]

animals[2, 3]
animals[c(2,3)]
animals[c(3, 1, 3)]

# conditional subsetting
weight_g
weight_g[c(T, F, T, T, F, T, T)]

weight_g > 50
weight_g[weight_g > 50]

# multiple conditions

weight_g[weight_g < 30 | weight_g > 50]
weight_g[weight_g >= 30 & weight_g == 105]

# searching for characters

animals[animals == "cat" | animals == "rat"]
animals[animals %in% c("rat", "antelope", "jackalope", "hippogriff")]

# challenge

"four" > "five"
"six" > "five"

# it's alphabetic order!!!

# missing values

heights <- c(2, 4, 4, NA, 6)
str(heights)

mean(weight_g)

mean(heights)

max(heights)

mean(heights, na.rm = T)

is.na(heights)
na.omit(heights)
complete.cases(heights)
