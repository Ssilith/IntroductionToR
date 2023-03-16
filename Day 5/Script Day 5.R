
## Day 5

### Tidyverse

# See packages already loaded
search()
help(package = base)

# Install and load tidyverse
install.packages("tidyverse")
library(tidyverse)

# Look at the packages inside tidyverse
help(package= tidyverse)
tidyverse_packages(include_self = TRUE)

# Look at dplyr package
help(package = dplyr)

#--------------

# Gapminder package
install.packages("gapminder")
library(gapminder)
gapminder

# Select() function
select(gapminder, country, year, pop)
select(gapminder, -lifeExp, -pop)
select(gapminder, country:lifeExp)

# Filter() function
# One condition
gapminder.1decade <- filter(gapminder, year >= 1997)
# Equivalent in base R
gapminder[ gapminder$year >= 1997, ]
# Look how many years there are for each country
help(package = gapminder)
# Multiple conditions in the filtering
filter(gapminder, year >= 1997, country == "Denmark")
# Or condition
filter(gapminder.1decade, country=="Denmark" | country == "Sweden")
filter(gapminder.1decade, country=="Denmark", country == "Sweden")
filter(gapminder.1decade, country %in% c("Denmark", "Sweden", "Norway"))

# Mutate()
mutate(gapminder, gdp = gdpPercap * pop)
mutate(gapminder, 
       gdp = gdpPercap * pop,
       log_gdp = log(gdp))

# Summarize
summarise(gapminder, mean_life_exp = mean(lifeExp))
summarise(gapminder, 
          mean_life_exp = mean(lifeExp),
          median_life_exp = median(lifeExp),
          sd_life_exp = sd(lifeExp),
          min_life_exp = min(lifeExp),
          max_life_exp = max(lifeExp))

# Summarize + group
gapminder.continent <- group_by(gapminder, continent)
gapminder.continent <- summarize(gapminder.continent, 
                                 mean_life_exp = mean(lifeExp))
gapminder.continent
gapminder.continent <- ungroup(gapminder.continent)

# Pipe
# Filter and pipe
# R base way
gapminder.filtered <- 
  filter(gapminder, year >= 1997, country == "Denmark")
gapminder.selected <- 
  select(gapminder.filtered, country, year)
# Magrittr (pipe) way
gapminder %>% 
  filter(year >= 1997, country == "Denmark") %>% 
  select(country, year)

# Summarize + group
# Traditional way
gapminder.continent <- group_by(gapminder, continent)
gapminder.continent <- summarize(gapminder.continent, 
          mean_life_exp = mean(lifeExp))
gapminder.continent <- ungroup(gapminder.continent)

# Pipe way
gapminder.continent2 <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_life_exp = mean(lifeExp)) %>%
  ungroup()

# Check
gapminder.continent
gapminder.continent2

# Reshape the dataset
# Arrange the observations
# increasing order
arrange(gapminder, gdpPercap)
# decreasing order
arrange(gapminder, desc(gdpPercap))

# Pivot()
setwd("C:/Users/aleg/Desktop")
data_wide <- 
  read.csv("LifeExpectancy_WideFormat.csv",
           header = TRUE,
           sep = ";")
head(data_wide)

long_data <- pivot_longer(data_wide, 2:4, 
             names_prefix = "X",
             names_to = "year",
             values_to = "lifeExp")





