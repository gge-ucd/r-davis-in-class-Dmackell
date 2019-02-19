library(tidyverse)
gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

#### 1A.==========================
#Modify the following code to make a figure that shows how life expectancy has changed over time

str(gapminder)

yearly_counts <- gapminder %>% 
  group_by(year) %>% 
  mutate(lifeEXP_mean = mean(lifeExp))

ggplot(yearly_counts, aes(x = year, y = lifeEXP_mean)) + 
  geom_point()


#### 1B.==========================
#Look at the following code. What do you think the scale_x_log10() line is doing? What do you think the geom_smooth() line is doing?

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

# scale_x_log10 converts the values of the x axis, in this case gdpPercap, by log base 10.
# geom_smooth created a regression line that is black and dashed

#### 1C. (Challenge!) ============
#Modify the above code to size the points in proportion to the population of the county. Hint: Are you translating data to a visual feature of the plot?

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, size = pop)) +
  geom_point(aes(color = continent), alpha = 0.3) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

