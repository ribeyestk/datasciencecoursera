########## Part 1
pollutantmean <- function(directory, pollutant, id = 1:332){
      files <- paste(sprintf("%03d", id), ".csv", sep = "")
      files <- paste(directory, files, sep = "/")
  
  data <- numeric()
  
  for (i in 1:length(files)) {
     temp <- read.csv(files[i], header = TRUE, sep = ",")
      temp <- temp[[pollutant]]
     data <- c(data, temp)
  }
  mean(data, na.rm = TRUE)
}

########## Part 2

complete <- function(directory, id = 1:332){

results <- data.frame(id=numeric(0), nobs=numeric(0))
for(monitor in id){
  path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
  monitor_data <- read.csv(path)
  interested_data <- monitor_data[(!is.na(monitor_data$sulfate)), ]
  interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
  nobs <- nrow(interested_data)
  results <- rbind(results, data.frame(id=monitor, nobs=nobs))
}
results
}

######### Part 3 
  
corr <- function(directory, threshold = 0){
  cor_results <- numeric(0)
  complete_cases <- complete(directory)
  complete_cases <- complete_cases[complete_cases$nobs>=threshold, ]
  if(nrow(complete_cases)>0){
    for(monitor in complete_cases$id){
      path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
      monitor_data <- read.csv(path)
      interested_data <- monitor_data[(!is.na(monitor_data$sulfate)), ]
      interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
      sulfate_data <- interested_data["sulfate"]
      nitrate_data <- interested_data["nitrate"]
      cor_results <- c(cor_results, cor(sulfate_data, nitrate_data))
    }
  }
  cor_results
}




#############################

complete_cases_per_file <- function(directory){
  library(tidyverse)
  
  # Get a list of all files in the directory
  files <- list.files(path = directory, full.names = TRUE)
  
  # Read each file, count the number of complete cases, and store the results in a data frame
  results <- data.frame(file = character(), complete_cases = numeric())
  for(file in files){
    data <- read.csv(file)
    complete_cases <- sum(complete.cases(data))
    results <- rbind(results, data.frame(file, complete_cases))
  }
  
  return(results)
}