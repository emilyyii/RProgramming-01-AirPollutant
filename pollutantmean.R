# calculate the mean of a pollutant across a specified list of monitors
pollutantmean <- function(directory, pollutant, id = 1:332){
      # create a list of file names with data
      fileNames <- list.files(directory, full.names = TRUE)[id]
      # initialize dataRaw data frame to store all data in the range
            dataRaw <- data.frame() 
      for(i in seq(along.with = id)){
            dataRaw <- rbind.data.frame(dataRaw, read.csv(fileNames[i]))
      }
      mean(dataRaw[[pollutant]], na.rm = TRUE )
}