complete <- function(directory, id = 1:332) {
        ##(str, vector of ints) -> df 
        
        ##Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the number of
        ## complete cases
        
        ## 'directory' is a character vector of length 1 indicating the location
        ## of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers to be used.
        
        df <- data.frame(matrix(ncol=2,nrow=0))
        
        names(df) <- c('id','nobs')
        
        for (i in id) {
                filename <- paste(directory,"/",formatC(i, width = 3, flag = "0")
                                  ,".csv", sep = "")
                data <- read.csv(filename)
                id <- i
                nobs <- nrow(data[complete.cases(data),])
                df <- rbind(df, data.frame(id,nobs))
        }
        
        df
}