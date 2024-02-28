##Create vector
x <-  c(12,13,14,15,16)

##select by index
x[1]

x[2:5]

x[c(1,3)]

##add obs to index

x[2] <-  5

x
## deleting
x[-2]
x

## getting Length

length(x)


x < 5
y <-  15



## Doing basic math

x <- 5
y <- 15 

# subtraction
y - x 

# dividing 
y / x

# multiply
y * x

# square
y**2

# Y3
y**3


# 12'nin kvadrati 
z = 12**2
z

# square root
sqrt(z)



#Vectors
x1 <- c(13,24,35,56)
x2 <- c(12,23,10,8)

x1 + x2
x1 * x2


# matrix(NULL# matrix()

x = c(1,2,3,4)
matrix(x , nrow = 2, ncol = 2)

mat = matrix(x , nrow = 2, ncol = 2 , byrow = TRUE)
mat

mat + 2


mat_df <-  as.data.frame(mat)

mat_df

names(mat_df)

names(mat_df) <-  c('A_variable','B_variable')

mat_df
mat_df$A_variable

x <- c(32,33,24,22,26,24,45,46,54,34,23,21,16,32,78,85,110)

# Central tendency measures  
min(x)
max(x)
mean(x)
median(x)
q <- quantile(x, probs = c(0.25, 0.5, 0.75))
q
q1 <-  quantile(x,0.25)
q3 <-  quantile(x,0.75)
q3
q1
## Variance measures

range = max(x) - min(x)
range
sd(x)
var(x)
IQR(x)
iqr = IQR(x)

##Outlier bound 
up_bound = q3 + 1.5*iqr
low_bound <-  q1- 1.5*iqr
up_bound
low_bound

## Draw
x

hist(x)

##Getting  index 
which(x > 79)
which(x == 22)


## delete where x < 79
x <-  x[which(x < 79)]
x


sort(x)
?sort()

x

sort(x,decreasing = T)

5 == 5
5 == 4
a = 5==4
class(a)




#Sampling
x <- seq(from = 100 , to = 300 , by = 10)
x

sample(x , size = 3)
y = sample(x , size = 5)
y

##repetition
rep(4 , 14)

##Data types

gender = c('Male', 'Female')
class(gender)

gender <-  factor(gender)
?factor()

class(gender)


### 
a = c(1.2,2,3,4)
class(a)
a <-  as.integer(a)
class(a)

b <-  c(1.2,5.0 , 4,5)
class(b)

a <-  factor(c('a','b','c','d'))
a

a <-  as.character(a)
class(a)


x <- c(32,33,24,22,26,24,45,46,54,34,23,21,16,32,78,85,110)

as.data.frame(x)

df <-  as.data.frame(x)
df

summary(df)



x <-  data.frame("yaslar" = c(23,24,26,28,29,30,34,24) ,
                    'cins' =  c('F','F','F','M','M','F','M','F'))
x
class(x)

class(x$yaslar)
class(x$cins)

summary(x)

class(x)
sapply(x,class)


x$cins <-  factor(x$cins)

class(x$cins)


summary(x)

getwd()


#install.packages('readr')
library(readr)

df <- read.csv('https://raw.githubusercontent.com/HumayDS/Digital-Data-Analytics-spring-2024-/main/tips.csv')

summary(df)

sapply(df,class)

df$smoker <-  factor(df$smoker)
df$sex <-  factor(df$sex)
df$day <-  factor(df$day)
df$time <-  factor(df$time)

sapply(df,class)
summary(df)



# Delete variable '
df <- subset(df, select = -sex)
df





