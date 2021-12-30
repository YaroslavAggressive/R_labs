# Title     : TODO
# Objective : TODO
# Created by: tyryk
# Created on: 28.12.2021

fix_data <- function(df){
  for (row in df){
    for (cell in row){
      if (!grepl("[a-zA-Z]", cell)){
        df[df == cell] <- gsub(" ", "", cell)
      }
    }
  }
  return(df)
}

data <- read.csv("test_data_01.csv")
processed_data <- fix_data(data)
print(processed_data)