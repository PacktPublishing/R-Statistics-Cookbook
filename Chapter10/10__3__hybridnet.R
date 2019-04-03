library(bnlearn)

data           = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data")
colnames(data) = c("sex","length","diameter","height","whole_weight","shucked_weight","viscera_weight","shell_weight","rings") 
data$rings     = log(data$rings)
  
dag     = model2network("[sex][length|sex][diameter|sex][height|sex][whole_weight|length:diameter:height][shucked_weight|length:diameter:height][viscera_weight|length:diameter:height][shell_weight|length:diameter:height][rings|whole_weight:shucked_weight:viscera_weight:shell_weight]")
parm    = list(nodes = nodes(dag), arcs = arcs(dag),col = "black", textCol = "black")
graphviz.plot(dag, highlight = parm)


fitted = bn.fit(dag, data)

cpquery(fitted, event = (sex == "M"),evidence = list(diameter=0.65,whole_weight=.8), method = "lw")
cpquery(fitted, event = (sex == "M"),evidence = list(diameter=0.15,whole_weight=.8), method = "lw")

cpdist(fitted, nodes = c("height"),evidence = (viscera_weight > 0.4))

head(predict(fitted,"rings",data))
head(predict(fitted,"whole_weight",data))
