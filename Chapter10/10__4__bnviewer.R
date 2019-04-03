library("bnviewer")
library("bnlearn")


data           = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data")
colnames(data) = c("sex","length","diameter","height","whole_weight","shucked_weight","viscera_weight","shell_weight","rings") 
data$rings     = log(data$rings)

dag     = model2network("[sex][length|sex][diameter|sex][height|sex][whole_weight|length:diameter:height][shucked_weight|length:diameter:height][viscera_weight|length:diameter:height][shell_weight|length:diameter:height][rings|whole_weight:shucked_weight:viscera_weight:shell_weight]")
parm    = list(nodes = nodes(dag), arcs = arcs(dag),col = "black", textCol = "black")

viewer(dag,
       bayesianNetwork.width    = "100%",
       bayesianNetwork.height   = "80vh",
       bayesianNetwork.layout   = "layout_with_sugiyama",
       bayesianNetwork.title    = "Abalone network",
       bayesianNetwork.subtitle = "User defined network",
       bayesianNetwork.footer   = "Fig. 1 - live diagram"
)

viewer(dag,
       bayesianNetwork.width    = "100%",
       bayesianNetwork.height   = "80vh",
       bayesianNetwork.layout   = "layout_as_tree",
       bayesianNetwork.title    = "Abalone network",
       bayesianNetwork.subtitle = "User defined network",
       bayesianNetwork.footer   = "Fig. 1 - live diagram"
)