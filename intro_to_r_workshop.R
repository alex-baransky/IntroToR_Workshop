##########################################
############### Intro To R ###############
############## Alex Baransky #############
######## NYC Data Science Academy ########
##########################################

# To install a package, use install.packages("package_name")
install.packages("ggplot2")

# Load packages using the library function
library(ggplot2)   # Notice no quotes here


#### Assigning Values to Variables ####

x <- 5
y = 8
x + y


#### Calling functions ####

sin(0)
log(100, 10)       # What is the second argument here?
?log               # Useful for finding more information about functions
log(100, base = 2) # We can assign arguments explicitly using their name

x <- pi/2          # pi is a constant in R
sin(x)
cos(x)
sin(sin(x) + x)


#### Class function ####

class(4)
class('a')
class(TRUE)


#### Operators ####

2 + 1
2 - 1
2 * 3
2 / 3
2 ^ 3       # Power
2 %% 5      # Remainder (aka modulus)
8 %/% 3     # Integer division


#### Strings ####

class('Hello, World!')
class('1')
class("2")


#### Logical and Comparison Operators ####

1 == 1                # Use == for equality testing, not =
1 <= 2
1 >= 2
'aardvark' < 'aaron'  # Alphabetical order
'a' != 'b'            # != for not equal

1==1 & 2==3           # AND
1==1 | 2==3           # OR
!(1==1)               # NOT


#### Type Conversions ####

as.integer(5.6)
as.character(5.6)

x <- 5.5
y <- as.character(x)  # x keeps its original value
class(x)


#### Vectors ####

c(1,2,3,4)            # Combine
c('ab', 'cd', "ef")
c('ab', 3)            # 3 is converted to a character type

x <- c(1,2,3,4)
c(x,x)                # Creates a duplicated vector that is twice as long

x[1]                  # You can access the first element in x using square brackets


#### Creating Vectors ####

seq(1,10)
1:10                      # This creates the same vector
rnorm(10)                 # Default mean 0 and standard deviation 1
runif(10)                 # Default min 0 and max 1
sample(c('a','b','c'), size=5, replace=TRUE)
rep(0,10)
rep(c(1,2,3), c(1,2,3))   # Creates a vector with one 1, two 2s, and three 3s, 
                          # second vector must be same length as first

#### Vector Slicing ####

x <- c(1,2,3,4,5)
x[1]                      # Returns first element of x
x[c(1,4,5)]               # Returns elements with index 1, 4 and 5
x[seq(1,5, b=2)]          # Returns elements with index 1, 3 and 5
x[c(F,T,F,T,T)]           # Returns elemtns with index 2, 4 and 5


#### Vector Modification ####

x <- c(1,2,3,4,5)
x[2] <- 8                 # The element at index 2 is now the integer 8
x[2:3] <- 10              # Elements 2 and 3 are now the integer 10
x[3:5] <- c(11,12,13)     # Elements 3, 4 and 5 are now 11, 12 and 13 respectively


#### Named Vector Elements ####

x <- c(1,2,3,4,5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
x['a']                    # Returns the first element


#### Vector Computation ####

x <- c(1,2,3,4,5)
c(1,2,3,4) + c(5,6,7,8)
c(1,2,3,4) + 1
c(1,2,3,4) + c(1,2)       # This is the same as adding c(1,2,1,2)

c(1,2,3,4) >= c(5,1,7,1)  # FALSE TRUE FALSE TRUE
c(1,2,3,4) >= 2           # FALSE TRUE TRUE TRUE

x[ x>=2 & x<4 ]           # c(2,3)

exp(x)
class(x)
mean(x)
max(x)
min(x)
sd(x)
length(x)
summary(x)


#### Missing and Null Values ####

x <- c(1,2,NA,3,NA)
mean(x)
mean(x, na.rm=TRUE)


#### Creating Data Frames ####

city = c('Seattle', 'Chicago', 'Boston', 'Houston')
temp = c(78, 74, 50, 104)

citydf <- data.frame(city=city, temp=temp)   # We can omit the column labels
citydf

colnames(citydf) <- c('CITY', 'TEMP')        # We can change columns names by assinging a vector to colnames(df)
rownames(citydf) <- c('a', 'b', 'c', 'd')    # We can change row labels in a similar way
citydf


#### Data Frames: Subscripting and Slicing ####

citydf = data.frame(city, temp)
citydf[1,1]
citydf[1,2]
citydf[3,]                # slice containing third row, this retains the data frame structure
citydf[,2]                # Does not retain data frame stucture
citydf[,2,drop=F]         # Does retain data frame structure


#### Data Frames: Selecting and Slicing ####

citydf[, 'city']
citydf$city

ave = mean(citydf$temp)
citydf[citydf$temp > ave, ]

citydf$temp > ave         # Logical vector
citydf[c(T,F,F,T), ]      # Same as doing this


#### Functions on Data Frames ####

dim(citydf)
head(citydf)              # The df is only 4 rows, so both head and tail will show the full df
tail(citydf)

str(citydf)
summary(citydf)           # The numeric column shows statistics, the categorical column shows levels


#### Sorting Data Frames ####

order(citydf$temp)
citydf[order(citydf$temp),]  # Increasing order

order(citydf$temp, decreasing = TRUE)
citydf[order(citydf$temp, decreasing = TRUE),]


#### Exporting Data Frames to Files ####

write.table(citydf, file='my_data.csv', sep=',',
            row.names=F)
write.csv(citydf, file='my_data.csv', row.names=F)


#### Importing Data Frames from Files ####

read.csv('my_data.csv')
read.table('my_data.csv', header=TRUE, sep=',')


#### Functional Programming ####

data(iris)
head(iris)

v = 1:4
sapply(v, sqrt)

sapply(iris[ , 1:4], mean)                          # Vector with names elements

c(mean(iris$Sepal.Length), mean(iris$Sepal.Width),  # Otherwise we have to do this!
  mean(iris$Petal.Length), mean(iris$Petal.Width))

sapply(iris[ , 1:4], sd)
