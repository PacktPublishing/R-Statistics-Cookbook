library(dplyr)
library(leaflet)

line         = data.frame(lat = c(-54.777255,-38.038561),long=c(-64.936853,-57.529756),mag="start")
sub_data     = data.frame(lat = c(-54.777255,-38.038561,-46.12,-46.73333333333333),long=c(-64.936853,-57.529756,-59.69,-60.13333333333333),mag=c("start","end","sound anomaly","last known position"))
area_search  = data.frame(lat=-46.12,long=-59.69)

leaflet(data = sub_data) %>% addTiles() %>%
  addMarkers(~long, ~lat, popup = ~as.character(mag), label = ~as.character(mag)) %>%
  addPolylines(data = line, lng = ~long, lat = ~lat) %>% addCircles(lng = -59.69, lat = -46.12, weight = 1,radius = 120000)