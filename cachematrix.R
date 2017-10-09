## The next pair of functions cache the inverse of a matrix


makeCacheMatrix <- function(x = matrix()) {
  ## This function creates a special "matrix" object that can cache its inverse.
              inver <- NULL
              set <- function(y) {
              x <<- y
              inver <<- NULL
              }
              get <- function() x
              setInverse <- function(inverse) inver <<- inverse
              getInverse <- function()inver
              list(set = set, get = get,
                   setInverse = setInverse,
                   getInverse = getInverse)
}

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
            inver <- x$getInverse()
            if(!is.null(inver)) {
                        message("getting cached data")
                        return(inver)
            }
            data <- x$get()
            inver <- solve(data, ...)
            x$setInverse(inver)
            inver
}

