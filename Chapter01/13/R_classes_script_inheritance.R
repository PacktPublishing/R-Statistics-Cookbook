
library(R6)


customers = read.csv("./Customers_data_missing_products.csv")

Customer_missprod = R6Class(inherit = Customer,
                            public=list(Missing_prod = NULL,Missing_since = NULL,
initialize = function(customer_id,name,city,Missing_product,Missing_since){
  super$Customer_id  <- customer_id
  super$Name         <- name
  super$City         <- city
  self$Missing_prod  <- Missing_product
  self$Missing_since <- Missing_since
},
full_print = function(){
  print("------------------------------------")
  print(paste("Customer name ->",super$Name))
  print(paste("Customer city ->",super$City))
  print(paste("Missing prod  ->",self$Missing_prod))
  print(paste("Missing since ->",self$Missing_since))
  print("------------------------------------")
}
)
)

list_of_customers = list()
for (row in 1:nrow(customers)){
  row_read = customers[row,]
  customer = Customer_missprod$new(row_read$Customer_id,row_read$Name,row_read$City,row_read$Missing_product,row_read$Missing_since)
  list_of_customers[[row]] <- (customer)
}

list_of_customers[[1]]$full_print()





