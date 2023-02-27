add2 <- function(x, y) {
  x + y
}

above10 <- function(10) {
          use <- x > 10 
          x[use]
}

above <- function(x, n = 10) {
        use <- x > n
        x[use]
}

columnmean <- function(x) {
          nc <- ncol(x)
          means <- numeric(nc)
          for(i in 1:nc)
            means[i] <- mean(y[, i]) 
          }
       means
}