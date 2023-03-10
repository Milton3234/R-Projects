library(ggplot2)

View(data_basketball)
##geom() function with ggplot
ggplot(data = data_basketball,aes(x = PointsPerGame))
##geom function defines the type of plot will be adding to the plot axis
ggplot(data = data_basketball,aes(x = PointsPerGame)) +
  geom_bar()

##Creating a density plot with 'Three Points per Game' on the x-axis
ggplot(data = data_basketball,aes(x = ThreePtPerGame)) +
  geom_density()

ggplot(data = data_basketball,aes(x = PointsPerGame)) +
  geom_histogram()

ggplot(data = data_basketball,aes(y = RebPerGame)) +
  geom_bar()
##Defining both x and y axis
ggplot(data = data_basketball,aes(x = PointsPerGame, y = AssistPerGame)) +
  geom_point() ##point(scatter Plot)

ggplot(data = data_basketball,aes(x = Position, y = PointsPerGame )) +
  geom_col()

##Adding colour,shape,size,bins size on histogram etc 
ggplot(data = data_basketball,aes(x = PointsPerGame, y = AssistPerGame)) +
  geom_point(color = 'red')

ggplot(data = data_basketball,aes(x = PointsPerGame, y = AssistPerGame)) +
  geom_point(shape = 'square',size = 3)

ggplot(data = data_basketball,aes(x = PointsPerGame)) +
  geom_histogram(bins = 5)

##Create a column chart that shows the  points per game average for each position
#colour the points differently for each position

data_basketball %>% 
  group_by(Position) %>% 
  summarise(ppg_average = mean(PointsPerGame)) %>% 
  ggplot(aes(x = Position, y = ppg_average, fill = Position )) +
  geom_col(linewidth = 5)##instead of using size use linewidth.size was deprecated in ggplot2 3.4.0 although it also worked for this code.

##Layer Geoms
ggplot(data = data_basketball,aes(x = PointsPerGame, y = ThreePtPerGame)) +
  geom_point() +
  geom_smooth()

  
ggplot(data = data_basketball,aes(x = Position, y = ThreePtPerGame)) +
  geom_col(aes(y = StealsPerGame), fill = 'purple') +
  geom_point(colour = 'orange', size = 2,position = 'jitter')

plot_example<- ggplot(data = data_basketball, aes(x = Position, y= ThreePtPerGame)) +
  geom_col(aes(y = StealsPerGame), fill = 'purple') +
  geom_point(colour = 'orange',size = 2, position = 'jitter')

##Create a scatter plot of points per game and blocks per game,
#Then, add a red geom_smooth() line of best fit without the confidence interval around the line
#Add another geom_smooth() with a y aesthetic of Steals Per Game
plot_exercise1<-ggplot(data= data_basketball,aes(x = PointsPerGame,y = BlocksPerGame)) +
  geom_point() +
  geom_smooth( se = FALSE, colour = 'red') +
  geom_smooth(aes(y = StealsPerGame))
plot_exercise1
        
##Facet wrapping
ggplot(data = data_basketball,aes(x = PointsPerGame, y = RebPerGame)) +
  geom_point() +
  facet_wrap(~Position)

ggplot(data = data_basketball,aes(x = PointsPerGame, y = RebPerGame)) +
  geom_point() +
  facet_wrap((c('Position','Country')),nrow = 2)

##
Plot_base<-ggplot(data = data_basketball,aes(x = PointsPerGame, y = ThreePtPerGame)) +
  geom_point(aes(colour = Country), position = 'jitter') +
  geom_smooth(se=F)
Plot_base
##we can apply theme function to change appearance of our images as #in the examples below
Plot_base +
  theme_light()

Plot_base +
  theme_dark()

##we can override themes with the theme function
Plot_base +
  theme(
    rect = element_rect(fill = 'red'),
    line = element_line(size = 4)
  )

##How we can modify labels and legends of our graphs and charts
Plot_base<- ggplot(data = data_basketball,aes(x = PointsPerGame, y = ThreePtPerGame)) +
  geom_point(aes(colour = country), position = 'jitter') +
  geom_smooth(se = FALSE)

Plot_base +
  labs(x = 'PPG',
       y = '3ptG')

Plot_base +
  labs(x = 'PPG',
       y = '3ptG',
       title = 'PPG vs 3PtG',
       subtitle = 'Basketball',
       caption = 'The relationship between points and 3 pointers'
       )
##Changing legend position or even removing it altogether
Plot_base + theme(legend.position = 'left')
Plot_base + theme(legend.position = 'right')
Plot_base + theme(legend.position = 'bottom')
Plot_base + theme(legend.position = 'none')


Plot_base + 
  theme(legend.position = 'bottom') +
  guides(colour = guide_legend(nrow = 2, override.aes = list(size = 10)))

#Exercise
##Create a new column in data_basketball, "BlocksAboveOne", that bins the BlocksPerGame column into two categories:
#"Yes" if Blocks per Game is greater than or equal to 1
#"No" if less than 1
##Create a scatter plot with Rebounds per Game on the x-axis and Blocks per Game on the y-axis
##Color the points of the scatter plot by the new BlocksAboveOne column, setting the size to 5
##Create a subplot for each value of Position and remove the legend from the plot
data_basketball %>% 
  mutate(BlocksAboveOne = case_when(
    BlocksPerGame >= 1 ~ "Yes",
    BlocksPerGame < 1 ~ "No"
  )) %>% 
  ggplot(aes(x = RebPerGame, y = BlocksPerGame)) +
  geom_point(aes(colour = BlocksAboveOne, size = 5)) +
  facet_wrap('Position') +
  theme(legend.position = 'none')

##we can change Stats to a different type of aggregation
ggplot(data = data_basketball,aes(x = Team, y = RebPerGame)) +
  geom_bar(stat = 'summary', fun = 'mean') +
  theme(axis.text.x = element_text(angle = 90))

ggplot(data = data_basketball,aes(x = Team, y = RebPerGame)) +
  stat_summary(geom = 'bar',fun = 'mean',fill = 'blue') +
  theme(axis.text.x = element_text(angle = 90))

##Scales
plot_scale <- ggplot(data = data_basketball,aes(x = PointsPerGame, y = ThreePtPerGame)) +
  geom_point()

plot_scale +
  scale_x_binned() +
  scale_y_reverse()

ggplot(data = data_basketball, aes(x = Position)) +
  geom_col(aes(y = StealsPerGame),fill = 'purple') +
  geom_point(aes(y = ThreePtPerGame * 5),colour = 'orange',size = 4, position = 'jitter') +
  scale_y_continuous(
    name = 'Steals Per Game',
    sec.axis = sec_axis(~./5, name = 'Three Per Game')
  ) +
  theme(axis.title.y.right = element_text(colour = 'orange'),
        axis.text.y.right = element_text(colour = 'orange'),
        axis.ticks.y.right = element_line(colour = 'orange')
        )
