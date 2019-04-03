# Load required package
library(gapminder)
library(gganimate)
# Basic scatter plot

data = read.csv("./companies.csv",stringsAsFactors = FALSE)
colors = c("A"="#AB5406","B"="#EC9936","C"="#BE1826","D"="#9B4A06","E"="#FDD6A2","F"="#9ACD62")

p = ggplot(data, aes(Sales, Profit, size = Profit,colour=Company)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = colors) +
  scale_size(range = c(2, 12)) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'Sales', y = 'Profit') +
  transition_time(Year) +
  ease_aes('linear')

animate(p, nframes = 48, renderer = gifski_renderer("/Users/admin/Documents/R_book/gganim.gif"))
