
### Set Work Directory

library(tidyverse)
library(gapminder)


### Exercise 1

# Rows with a life expectancy >= 80 
filter(gapminder, lifeExp >= 80)

# Rows from European countries
filter(gapminder, continent == "Europe")


### Exercise 2

# Rows with life expectancy >= 80 AND GDP per capita >= 30,000 
filter(gapminder, lifeExp >= 80, gdpPercap >= 30000)

# Rows with life expectancy >= 80 OR GDP per capita >= 30,000 
filter(gapminder, lifeExp >= 80 | gdpPercap >= 30000)


### Exercise 3

# Population in millions
mutate(gapminder, pop_m = pop/1e6) 


### Exercise 4

# Mean and median population for the gapminder data
summarise(gapminder, 
		mean_pop = mean(pop), 
		median_pop = median(pop)) 

# Mean and median population for each continent
gapminder.bycontinent <- group_by(gapminder, continent)
summarise(gapminder.bycontinent, 
		mean_pop = mean(pop), 
		median_pop = median(pop))


### Exercise 5

# Average life expectancy per country
gapminder.bycountry <- group_by(gapminder, country)
summarised_life_exp <- summarise(gapminder.bycountry, 
						mean_life_exp = mean(lifeExp))

# Shortest average life expectancy
arrange(summarised_life_exp, mean_life_exp)

# Longest average life expectancy
arrange(summarised_life_exp, desc(mean_life_exp))


### Exercise 6

# Unpiped form
gapminder_bycontinent <- group_by(gapminder, continent)
gapminder_unpiped <- summarize(gapminder_bycontinent, 
					n_obs = n(), 
					n_countries = n_distinct(country))

# Piped form
gapminder_piped <- gapminder %>%
  group_by(continent) %>%
  summarize(n_obs = n(), n_countries = n_distinct(country)) 

gapminder_unpiped
gapminder_piped
