# reads all the files and reports the number of completely observed cases in each data file
complete <- function(directory, id =  1:332){
      # initialize nobs data frame of 2 cols of id number and complete count
      nob <- data.frame(id = id, nobs = vector("numeric", length = length(id)))
      # create a list of target id files
      fileNames <- list.files(directory, full.names = TRUE)[id]
      # read each file put number of complete cases in nobs col
      for(i in seq(along.with = id)){
            dataRaw <- read.csv(fileNames[i])
            nob$nobs[i] <- sum(complete.cases(dataRaw$sulfate,dataRaw$nitrate))
      }
      nob
}