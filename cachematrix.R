## Cacheing inverse and using inverse if already solved from cached Else calculate



makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setInv <- function(solve) s <<- solve
  getInv <- function() s
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}

# creacting function with above vector


cacheSolve <- function(x, ...) {
  s <- x$getInv()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setInv(s)
  s
}
