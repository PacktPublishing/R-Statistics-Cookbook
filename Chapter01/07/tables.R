library(expss)
library(formattable)

data = read.csv("/Users/admin/Documents/R_book/chapter01/07/person_salary.csv",stringsAsFactors = FALSE)
Green = "#71CA97"
Green2 = "#DeF7E9"

table__out = data.frame(table(data$Career,data$Age))
colnames(table__out) = c("Career","Age","Freq")
formattable(table__out,align =c("c","c","c"), list("Freq"= color_tile(Green, Green2)))

formattable(data,align =c("c","c","c","c"), list(
  "Person" = formatter("span", style = ~ style(color = "grey",font.weight = "bold")), 
  "Salary"= color_tile(Green, Green2),
  "Contacted" = formatter("span",
                         style = x ~ style(color = ifelse(x, "green", "red")),
                         x ~ icontext(ifelse(x, "ok", "remove"), ifelse(x, "Yes", "No")))))




