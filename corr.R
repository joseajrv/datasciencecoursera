corr <- function(directory, threshold = 0) {
        ## (str, int) -> numeric vector
        
        ## Return a numeric vector of correlations, without rounding the result,
        ## of the pollutants for monitor locations where the number of 
        ## completely observed cases > threshold.
        
        ## 'directory' is a character vector of length 1 indicating the location
        ## of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the number of 
        ## completerly observed cases (on all variables) required to compute
        ## the correlation between nitrate and sulfate; the default is 0.
        
        files <- dir(directory, full.names = TRUE)
        
        data <- vector()
        
        for (i in files) {
                monitor <- read.csv(i)
                cc <- monitor[complete.cases(monitor),]
                if (nrow(cc) > threshold) {
                        data <- c(data, cor(cc$sulfate,cc$nitrate))
                }
        }
        
        data
}