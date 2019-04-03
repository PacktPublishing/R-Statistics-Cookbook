#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
int bring_element (NumericVector rand_vector, NumericMatrix rand_matrix) {
  Rcout << "Process starting" << std::endl;
  int mcounter = 0;
  
  for (int q = 0; q < rand_vector.size();q++){
    for (int x = 0; x < rand_matrix.rows();x++){
      for (int y = 0; y < rand_matrix.cols();y++){
        double v1 = rand_matrix.at(x,y);
        double v2 = rand_vector[q];
        if ( v1 < v2){
          mcounter++;
        }
      } 
    }
  }
  
  Rcout << "Process ended" << std::endl;
  return mcounter;
}
