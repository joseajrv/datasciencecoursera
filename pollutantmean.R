pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## (str, str, vector of ints) -> numeric
        
        ## Return the mean of the pollutant across all monitors list in the
        ## 'id' vector (ignoring NA values) without rounding the result.
        
        ## 'directory' is a character vector of length 1 indicating the location
        ## of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating the name
        ## of the pollutant for which we will calculate the mean; either
        ## "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers to be used.
        

        value <- vector()
        
        for (i in id) {
                filename <- paste(directory,"/",formatC(i, width = 3, flag = "0")
                                  ,".csv", sep = "")
                data <- read.csv(filename)
                value <- c(value,data[,pollutant])
                
        }
        
        mean(value[!is.na(value)])
}