

library(dplyr)


mtcars

mtcars %>% group_by(am,gear) %>% summarise(mean_hp = mean(hp),sum_mpg = sum(mpg)) %>% ungroup %>% arrange(mean_hp)
