complete <- function(directory, id=1:332) {
        files_list <- dir(directory, full.names = TRUE)
        nobs <- c()
        
        for (i in id) {
                data <- read.csv(files_list[i])
                sum_complete <- sum(complete.cases(data))
                nobs <- c(nobs, sum_complete)
        }
        
        data_complete <- data.frame(id, nobs)
        data_complete
}