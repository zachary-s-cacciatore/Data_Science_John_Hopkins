corr <- function(directory, threshold = 0) {
        files_list <- dir(directory, full.names = TRUE)
        corr_vec <- numeric()
        
        for (i in files_list) {
                corval <- 0
                data <- read.csv(i)
                value <- sum(complete.cases(data))
                data <- data[complete.cases(data),]
                
                if (value > threshold) {
                        sulfate <- data[['sulfate']]
                        nitrate <- data[['nitrate']]
                        corval <- cor(nitrate, sulfate, use = "pairwise.complete.obs" )
                        corr_vec <- c(corr_vec, corval)
                }
        }
        corr_vec
}