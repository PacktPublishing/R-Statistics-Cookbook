install.packages('DiagrammeR')

library('DiagrammeR')

grViz("
digraph dot {
      
      graph [layout = dot]
      
      node [shape = circle,
      style = filled,
      color = grey,
      label = '']
      
      node [fillcolor = white,fixedsize = true, width = 2]
      a[label = 'Company A']
      
      node [fillcolor = white]
      b[label = 'IT+RD Consulting'] c[label = 'General Consulting'] d[label = 'Other Activities']
      
      node [fillcolor = white]
      
      edge [color = grey]
      a -> {b c d}
      b -> {e[label = '254';color=blue] f[label = '83%';color=green]}
      c -> {k[label = '132';color=blue] l[label = '61%';color=green]}
      d -> {q[label = '192';color=blue] r[label = '47%';color=green]}
      }")
