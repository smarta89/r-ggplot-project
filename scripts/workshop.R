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

ggplot(data = interviews_plotting, 
       aes (x = no_membrs, y = number_items)) +
  geom_jitter(alpha = 0.5, width =0.15, height = 0.15)
## to tell it how much you want it to jitter by. in this case it will move each point up to 0.15 units away from the original place

interviews_plot <- ggplot(data = interviews_plotting, 
                          aes (x = no_membrs, y = number_items)) +
  geom_jitter(alpha = 0.5, width =0.15, height = 0.15)
##to save this line of data as interviews_plot

ggsave ("fig_output/membrs_item.png", interviews_plot, width = 15, height = 10, dpi =72)
## to save the plot with specific dimensions and clarity dpi 

interviews_plot <-ggplot(data = interviews_plotting, 
                          aes (x = no_membrs, y = number_items, color=village)) +
  geom_jitter(alpha = 0.5, width =0.2, height = 0.2, size = 5)+
  geom_smooth(method="lm")

## to change point size 
## to change colours
## smooth to add line of fit
## if it doesnt plot the change highlight what you want it to do and then press control enter

ggsave("fig_output/membrs_itm.png", interviews_plot, width=15, height=10, dpi=72)
##to save the new plot over the old plot with specifics

## new exercise number 6

ggplot(data=interviews_plotting,
       aes(x=rooms, y=village, color=respondent_wall_type)) +
  geom_point(alpha=0.5) +
  geom_jitter(alpha=0.5, width=0.2, height=0.2, size=4) +
  geom_smooth(method="lm")
## this is a stupid way to present this data, but I did what the exercise asked, good job

exercise_6_plot <- ggplot(data=interviews_plotting,
                          aes(x=rooms, y=village, color=respondent_wall_type)) +
  geom_point(alpha=0.5) +
  geom_jitter(alpha=0.5, width=0.2, height=0.2, size=4) +
  geom_smooth(method="lm")

ggsave("fig_output/rooms_village.png", exercise_6_plot, width = 15, height=10, dpi=72)
## saved good

ggplot(data=interviews_plotting,
       aes(x=village, y=rooms, color=respondent_wall_type)) +
  geom_jitter(alpha=0.5, width=0.2, height=0.2, size=4)
##swapped axis

ggplot(data=interviews_plotting, aes(x=no_membrs)) +
  geom_histogram(binwidth=1)
## to plot histogram
##changed binwidth because there cannot be half people so made it 1

ggplot(data=interviews_plotting, aes(x=no_membrs)) +
  geom_histogram(binwidth=1, color="white")
##outlines the bars to show individual bars better

ggplot(data=interviews_plotting, aes(x=no_membrs, fill=village)) +
  geom_histogram(binwidth=1, color="white")
##adding colours for each village, still hard to read though, maybe histogram not the best choice

ggplot(data=interviews_plotting, aes(x=no_membrs, color=village)) +
  geom_freqpoly(binwidth=1)
## to plot it as lines, better visual but still not the best, maybe plot a particular y axis

ggplot(data=interviews_plotting, aes(x=no_membrs, y=stat(density), color=village)) +
  geom_freqpoly(binwidth=1)
##now everything has been scaled to the amount of data we have

ggplot(data=interviews_plotting, aes(x=no_membrs, color=village)) +
  geom_density()
##smooths it out to a curve, not the best for this particular data but good to know

ggplot(data=interviews_plotting, aes(x=no_membrs, fill=village)) +
  geom_density(alpha=0.4)
##to change aesthetics
















