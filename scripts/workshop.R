## Use this file to follow along with the live coding exercises.
## The csv file containing the data is in the 'data/' directory.
## If you want to save plots you created, place them in the 'figures/' directory.
## You can create additional R files in the 'scripts/' directory.

library(tidyverse)

interviews_plotting <- read_csv("data_output/interviews_plotting.csv")

ggplot(data = interviews_plotting)
## only tells ggplot what data, not specifically what to plot

ggplot(data = interviews_plotting,
       aes(x =no_membrs, y = number_items))
##gives the axis but not how we want to display it, eg bar or scatter?

ggplot(data = interviews_plotting, 
       aes (x = no_membrs, y = number_items)) +
  geom_point()
## scatter plot

ggplot(data = interviews_plotting, 
       aes (x = no_membrs, y = number_items)) +
  geom_line()
##line plot

ggplot(data = interviews_plotting, 
       aes (x = no_membrs, y = number_items)) +
  geom_point(alpha = 0.5)
## point transparency is alpha, the darker the points the more points on that spot

ggplot(data = interviews_plotting, 
       aes (x = no_membrs, y = number_items)) +
  geom_jitter(alpha = 0.5)
##instead of each point being exactally on the point it is slightly off point so we can see all the points and where they lie

