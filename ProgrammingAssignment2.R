## The below functions cache the inverse of a matrix.

## The function makeCacheMatrix creates a special "matrix", which is really a list containing a function to
## set the value of the Matrix
## get the value of the Matrix
## set the value of the Inverse Matrix
## get the value of the Inverse Matrix
makeCacheMatrix <- function(x = matrix()) {
m<-NULL
set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function()x
setinverse<-function(solve)m<<-solve
getinverse<-function()m
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## The following function calculates the inverse of the special "matrix" created with the above function. 
## However, it first checks to see if the inverse has already been calculated.
## If so, it gets the inverse from the cache and skips the computation.
## Otherwise, it calculates the inverse of the data 
## and sets the value of the inverse in the cache via the setinverse function.
cacheSolve <- function(x, ...) {
        m<-x$getinverse()
        if(!is.null(m)){
          message("getting cache data")
          return(m)
        }
        data<-x$get()
        m<-solve(data,...)
        x$setinverse(m)
        m
        }
