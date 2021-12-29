# Title     : TODO
# Objective : TODO
# Created by: tyryk
# Created on: 28.12.2021
library(plyr)
load("data.RData")

get_id <- function(df){
  temp_df <- join_all(data, by = 'id', type = 'inner')
  means <- data.frame(id = temp_df[, 1], temperature = rowMeans(temp_df[, -1]))
  return(means)
}

result <- get_id(data)
print(result)