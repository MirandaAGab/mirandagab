require(readr)
require(ggplot2)
require(dplyr)

# Everything I create, in my profile, in R I'll try to create as equal as possible in Python.

# Data from: https://www.kaggle.com/abcsds/pokemon


# Pre-processing
df = read_csv("Pokemon.csv")
df$Legendary = ifelse(df$Legendary == FALSE, 'Not Legendary', 'Legendary')

# One Scatterplot Chart
ggplot(data = df, aes(x = HP, y = Attack, color = as.factor(Legendary))) + xlim(c(0, 300)) + ylim(c(0, 200)) +
  geom_point() + labs(title='Scatterplot Chart Example')

# Several Scatterplot Chart
ggplot(data = df, aes(x = HP, y = Attack, color = as.factor(Legendary))) + xlim(c(0, 300)) + ylim(c(0, 200)) +
  geom_point() + labs(title='Scatterplot Chart Example') + facet_wrap(.~Generation)

# Bar Chart
ggplot(data = df, aes(x = Generation)) + geom_bar(fill = 'blue')  + ylim(c(0, 170)) +
  labs(x = 'Generation', y = 'Count') + labs(title='Bar Chart Example')

# BoxPlot Chart
ggplot(data = df, aes(x = Legendary, y = HP, fill = Legendary)) + geom_boxplot() + 
  labs(x = 'Legendary', y = 'HP') + labs(title='BoxPlot Chart Example') + 
  stat_summary(fun.y=mean, geom="point", shape=15, size=3) + 
  guides(fill = F)

# Density Chart
ggplot(data = df, aes(x = HP)) + geom_density(aes(fill =Legendary), alpha = .7) + 
  labs(title = 'Density Chart Example', y = 'Density')

# Histogram Chart
ggplot(data = df, aes(x = HP)) + geom_histogram(binwidth = 15, fill = 'blue') +
  labs(title = 'Histogram Chart Example', ylab = 'Count')