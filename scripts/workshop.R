## Use this file to follow along with the live coding exercises.
## The csv file containing the data is in the 'data/' directory.
## If you want to save plots you created, place them in the 'figures/' directory.
## You can create additional R files in the 'scripts/' directory.

library(tidyverse)

##REMEMBER control enter to get a line to do something

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

##LOOKING AT CATEGORICAL DATA

ggplot(data=interviews_plotting, 
       aes(x=respondent_wall_type, fill=village)) + 
  geom_bar()
##without fill you will just get a plain bar chart, a count of all wall types regardless of village

ggplot(data=interviews_plotting, 
       aes(x=respondent_wall_type, fill=village)) + 
  geom_bar(position="dodge")
##to change from a standard stacked bar chart from previous step into bars next to each other, much better
## unfortunately because there are no values for two of the villages with cement it looks stupid. maybe ensure you have zeros? don't knwo

ggplot(data=interviews_plotting, 
       aes(x=respondent_wall_type, fill=village)) + 
  geom_bar(position="dodge") + facet_wrap(~respondent_wall_type)
##seperates into seperate graphs see image saved '4graph'

ggplot(data=interviews_plotting, 
       aes(x=village, fill=village)) + 
  geom_bar(position="dodge") + facet_wrap(~respondent_wall_type)
##tochange the 4 graphs - change it to make it present better - see image '4grap2'

ggplot(data=interviews_plotting, 
       aes(x=village, fill=village)) + 
  geom_bar(position="dodge") + facet_wrap(~respondent_wall_type) +
  theme_classic()
##removed grid lines

ggplot(data=interviews_plotting, 
       aes(x=respondent_wall_type, fill=village)) + 
  geom_bar(position="fill")  + 
  scale_fill_brewer(palette="RdBu") +ylab("proportion")
##to show proportions also changed colours

ggplot(data=interviews_plotting, 
       aes(x=respondent_wall_type, fill=village)) + 
  geom_bar(position="fill")  + 
  scale_fill_brewer(palette="forestgreen") +ylab("proportion")+
  stat_count(geom="text", aes(label=stat(count)), position=position_fill(vjust=0.5), color="black")
##pretty green colour, with the numbers shown in each proportion. see image 'proportionbar'

ggplot(data=interviews_plotting, 
       aes(x=village, fill=respondent_wall_type)) + 
  geom_bar(position="fill")  + 
  scale_fill_brewer(palette="forestgreen") +ylab("proportion")+
  stat_count(geom="text", aes(label=stat(count)), position=position_fill(vjust=0.5), color="black")
##swapping axis

ggplot(data=interviews_plotting, aes(x=respondent_wall_type, y=rooms)) +
  geom_boxplot(size=0.5) + geom_jitter(alpha=0.5, width=0.2, height=0.2, color="purple", size=2)
## puts the data points on top of a box plot, remove jitter for plain box plots, the black dots are outliers - see image 'box'

ggplot(data=interviews_plotting, aes(x=respondent_wall_type, y=rooms)) +
  geom_boxplot(size=0.5, alpha=0) + geom_jitter(alpha=0.5, width=0.2, height=0.2,  size=2, aes(color=village))
##if you put alpha=0 it will not show the outliers, also colour coding the dots to village

ggplot(data=interviews_plotting, aes(x=respondent_wall_type, y=liv_count)) +
  geom_boxplot(size=0.5, alpha=0) + geom_jitter(alpha=0.5, width=0.2, height=0.2,  size=2, aes(color=memb_assoc))
## just looking at different variables

ggplot(data=interviews_plotting, 
       aes(x=respondent_wall_type, y=liv_count, fill=memb_assoc, 
           color=memb_assoc)) +
  geom_boxplot(alpha=0.5) + 
  geom_point(alpha=0.5, 
             position=position_jitterdodge(jitter.width=0.1, jitter.height=0.1))
##puts the relevant jitter dots near the relevant boxplot

##violin plots

ggplot(data=interviews_plotting, 
       aes(x=respondent_wall_type, y=rooms, color=village))+
  geom_violin(alpha=0, size = 1)+
  geom_jitter(alpha=0.5, width=0.2, height=0.2, aes(color=village))
##remove color=village to turn them into 1 violin plot per wall type

##more plot customisation

ggplot(data=interviews_plotting, aes(fill=respondent_wall_type, x=village)) +
  geom_bar(position="fill")+
  stat_count(geom="text", aes(label=stat(count)), position=position_fill(vjust=0.5), color="white") +
  ylab("Proportion") + xlab("Village") +
  ggtitle("Proportion of wall type by village")

##ylab to change y axis label and same for xlab and x axis. ggtitle adds a title
## could also do: labs(x="Village", y="Proportion", title="Walltype by village") instead of seperate like above












