## Each row is data object and each column is a attribute
## Ordinal attributes have magnitude between successive values. 
            #Eg: Small Medium and Large
##R has five basic or "atomic" classes of objects: (character, numeric, integer, complex, logical)
## It should be noted that each vector can only contain objects of a same class. The exception being a "list"
## x <- c(1.7, "a") ------ This is a vector with the elements 1.7 and a. Keep in mind that this is going to get coerced as a character vector due to common denominator. Rather than letting r inplicitely do this based on common denominator, we can also prompt it to do so explicitly by using as.
## Matrix fill my column then go to the next. So matrix(1:6 nrow = 2, ncol = 3) means that it does 1,2 on first column then 3,4 in the second column and so on
