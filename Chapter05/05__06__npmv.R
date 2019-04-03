library(npmv)

nonpartest(Sepal.Length | Sepal.Width | Petal.Length | Petal.Width ~ Species, data = iris, permreps = 2000) 


ssnonpartest(Sepal.Length | Sepal.Width | Petal.Length | Petal.Width ~ Species, data = iris, test = c(1, 0, 0, 0), alpha = 0.05, factors.and.variables = TRUE) 
