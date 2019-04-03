
library(R6)


customers = read.csv("./Customers_data.csv")

Customer = R6Class(public=list(Customer_id = NULL,Name = NULL,City = NULL,
initialize = function(customer_id,name,city,Missing_product,Missing_since){
  self$Customer_id  <- customer_id
  self$Name         <- name
  self$City         <- city
},
is_city_in_america = function(){
  return (upper_(self$City) %in% c("NEW YORK","LONDON","MIAMI","BARCELONA"))
},
full_print = function(){
  print("------------------------------------")
  print(paste("Customer name ->",self$Name))
  print(paste("Customer city ->",self$City))
  print("------------------------------------")
}
),private=list(
upper_ = function(x){
 return (toupper(x))
}
))

list_of_customers = list()
for (row in 1:nrow(customers)){
  row_read = customers[row,]
  customer = Customer$new(row_read$Customer_id,row_read$Name,row_read$City)
  list_of_customers[[row]] <- (customer)
}

list_of_customers[[1]]$full_print()





