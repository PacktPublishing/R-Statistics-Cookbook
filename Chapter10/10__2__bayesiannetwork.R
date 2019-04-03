library(bnlearn)
library(ggplot2)

data    = read.csv("./employee_data.csv")[-1]
dag     = model2network("[Area][travel_time|Area][performance|travel_time:diet_quality][Recently_had_child][Sleep_quality|Recently_had_child:Area][diet_quality|Sleep_quality]")


ci.test("performance", "Sleep_quality", c("diet_quality", "travel_time"), test = "mi", data = data)
ci.test("diet_quality", "Area", c("Sleep_quality"), test = "mi", data = data)

ci.test("travel_time", "Area", test = "mi", data = data)
arc_strengths = arc.strength(dag, data = data, criterion = "mi")


ggplot(data=arc_strengths, aes(x=paste0(arc_strengths$from,"->",arc_strengths$to), y=strength)) +
  geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1),axis.title.x=element_blank())


dsep(dag,"travel_time","Recently_had_child")
dsep(dag,"travel_time","Sleep_quality")
dsep(dag,"travel_time","Sleep_quality","Area")
