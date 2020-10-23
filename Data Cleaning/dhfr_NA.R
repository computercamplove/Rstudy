#data cleanig - missing data
#DHFR dataset
dhfr <- read_csv("dhfr.csv")
View(dhfr)

# 2. check for Missing Value
 sum(is.na(dhfr))
 # [1] 0 - shows that data is clean
 
 # 3. randomly introduce NA to dataset
 
 na_gen <- function(dataset, num) {
         i <- 1
         while (i < num+1) {
                 idx <- sample(1:nrow(dataset), 1)
                 idy <- sample(1:ncol(dataset), 1)
                 dataset[idx, idy] <- NA
                 i = i + 1        
         }
         return(dataset)
 }
 dhfr <- dhfr[, -1]
 dhfr <- na_gen(dhfr, 100) 

 # 4.check again Missing Values
 sum(is.na(dhfr)) #[1] 100
 #check columns
 colSums(is.na(dhfr))#which columns contains NA values
 #View(colSums(is.na(dhfr))) - to see table columns with NA
 
 #check rows
 missdata <- dhfr[!complete.cases(dhfr),]
 sum(is.na(missdata)) # [1] 100
 
 # 5.Handling Missing Values
 
 # 5.1 First optrion = delete all NA from dataset
 
 clean1_dhfr <- na.omit(dhfr)
 sum(is.na(clean1_dhfr)) #[1] 0 
 
 # 5.2 Second - Perform imputation
 
 dhfr.impute <- dhfr
 
 for (i in which(sapply(dhfr.impute, is.numeric))) {
         dhfr.impute[is.na(dhfr.impute[,i]), i] <- colMeans(dhfr.impute[,i], na.rm = TRUE)
 }
 
 sum(is.na(dhfr.impute))
 