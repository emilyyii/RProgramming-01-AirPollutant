# calculate correlation between sulfate and nitrate for locations with complete cases greater than threshold

# This following process is not good, read file twice
corr <- function(directory, threshold = 0){
      # if no one above threshold, return--
      corr <- vector("numeric", length = 0)
      # data frame data with only ids above threshold
      comp <- complete(directory, 1:332)
      data <- comp[comp$nobs>threshold,]
      # generate filenames for only these data
      fileNames <- list.files(directory, full.names = TRUE)[data$id]
      # if no id over threshold, return initial corr
      if(nrow(data) == 0){
            corr
      }
      # else read data for each id to generate corr vector
      else{
            for(i in 1:nrow(data)){
                  dataRaw <- read.csv(fileNames[i])
                  sul <- dataRaw$sulfate
                  nit <- dataRaw$nitrate
                  corr[i] <- cor(sul[complete.cases(dataRaw)], nit[complete.cases(dataRaw)])
            }
            corr
      }
}

# should be initial a corr - read file - check complete.cases sum - if greater calcualte cor and add to a vector 
# - else next id