## This program shows how to make use of cache to speed up computation for matrix inverse

## makeCachematrix contains function to display the matrix as well as its inverse .
## and the set the matrix as well as its inverse.

makeCacheMatrix <- function(x = matrix()) {
    inverseMatrix <- NULL
    set <- function(newMatrix) {
        x <<- newMatrix
        inverseMatrix <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) inverseMatrix <<- inverse
    getInverse <- function() inverseMatrix
    list(get = get,set=set, setInverse = setInverse,getInverse = getInverse)
}


## CacheSolve checks if the inverse exists or not, 
## if it doesn't exist then it computes the inverse and saves it to the cache

cacheSolve <- function(x, ...){
        inverse <- x$getInverse()
        if (!is.null(inverse)){
            print("The inverse is available in the cache.... Retrieving")
            return(inverse)
        }
        x$setInverse(solve(x$get()))
        x$getInverse()
}
