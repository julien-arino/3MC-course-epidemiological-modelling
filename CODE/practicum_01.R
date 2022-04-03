# Assignation
X <- 10
X = 10

# Lists
L <- list()
L$a <- 10
L$b <- 3
L[["another_name"]] <- "Plouf plouf"


L[1]
L[[2]]
L$a
L[["b"]]
L$another_name

# Vectors
x = 1:10
y <- c(x, 12)
y

z = c("red", "blue")
z
z = c(z, 1)
z

# Matrices

A <- mat.or.vec(nr = 2, nc = 3)
A
B <- matrix(c(1,2,3,4), nr = 2, nc = 2)
B
C <- matrix(c(1,2,3,4), nr = 2, nc = 2, byrow = TRUE)
C

# Matrix operations
A*B
A %*% B

# Vector operations
x
x+1

# Dimensions
length(A)
dim(A)
length(x)
dim(x)

# Flow control
if (TRUE) {
  writeLines("It is true")
}

# 1 uniformly distributed random number between 0 and 1
# (by default, otherwise set min = and max = )
xi = runif(1) 
if (x <= 0.33) {
  writeLines("Smaller than approx. 1/3")
} else if (x <= 0.66) {
  writeLines("Between appox. 1/3 and aprox. 2/3")
} else {
  writeLines("Larger than approx. 2/3")
}

# For loops
for (i in 1:10) {
  writeLines(paste0("i=", i, "2*i=", 2*i))
}
for (j in c(1,3,4)) {
  writeLines(paste0("j=", j, "2*j=", 2*j))
}
for (n in c("truc", "muche", "chose")) {
  writeLines(n)
}
for (m in list("truc", "muche", "chose", 1, 2)) {
  if (is.character(m)) {
    writeLines(paste0(m, " is a string of length ", nchar(m)))
  } else {
    writeLines(paste0("m=", m))
  }
}

# lapply
l = list()
for (i in 1:10) {
  l[[i]] = runif(i)
}
lapply(X = l, FUN = mean)

unlist(lapply(X = l, FUN = mean))
sapply(X = l, FUN = mean)

# "Advanced" lapply
l = list()
for (i in 1:10) {
  l[[i]] = list()
  l[[i]]$a = runif(i)
  l[[i]]$b = runif(2*i)
}
sapply(X = l, FUN = function(x) length(x$b))


# Suppose we want to vary 3 parameters
variations = list(
    p1 = seq(1, 10, length.out = 10),
    p2 = seq(0, 1, length.out = 10),
    p3 = seq(-1, 1, length.out = 10)
)

# Create the list 
tmp = expand.grid(variations)
PARAMS = list()
for (i in 1:dim(tmp)[1]) {
    PARAMS[[i]] = list()
    for (k in 1:length(variations)) {
        PARAMS[[i]][[names(variations)[k]]] = tmp[i, k]     
    }
}
