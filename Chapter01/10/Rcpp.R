library(Rcpp)
sourceCpp("./rcpp_example.cpp")

Rfunc <- function(rand__vector,rand_matrix){
  mcounter = 0
  for (q in 1:length(rand__vector)){
    for (x in 1:dim(rand_matrix)[1]){
      for (y in 1:dim(rand_matrix)[2]){
        v1 = rand_matrix[x,y];
        v2 = rand__vector[q];
        if ( v1 < v2){
          mcounter = mcounter+1
        }
      } 
    }
  }
  return (mcounter)
}


some__matrix = replicate(500, rnorm(20))
some__vector = rnorm(100)


start_time <- Sys.time()
bring_element(some__vector,some__matrix)
end_time <- Sys.time()
print(end_time - start_time)


start_time <- Sys.time()
Rfunc(some__vector,some__matrix)
end_time <- Sys.time()
print(end_time - start_time)





