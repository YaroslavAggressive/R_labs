library(plyr)  # needed to check the emptyness of the dataframe

find_coldest_weekend <- function(df){
  Sys.setlocale("LC_TIME", "C")  # for correct names of the days of the week

  temp <- "T2M"
  date <- "YYYYMMDD"

  # we get the dates to get the days of the week for them
  dates <- seq(from = as.Date(df[1, date]), by = 1, length = dim(df)[1])

  weekdays <- weekdays(dates)
  df$weekdays <- weekdays

  df <- df[(df$weekdays == "Saturday" | df$weekdays == "Sunday"), ]

  min_temp <- Inf  # init values
  coldest <- 0

  while (!empty(df)) {

    weekend_len <- if (dim(df)[1] > 1) 2 else 1  # suddenly there is only one day off
    weekend <- head(df, weekend_len)
    mean_temp <- sum(weekend[temp]) / weekend_len
    df <- tail(df, -(dim(df)[1] - weekend_len))

    if (mean_temp < min_temp){
      min_temp <- mean_temp
      coldest <- weekend
    }

  }

  return(coldest)
}

df <- data.frame(read.table("RH_T.csv", header = TRUE, sep=","))  # reading data from input file
find_coldest_weekend(df)
