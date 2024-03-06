getwd()
setwd()

##Create data frame
x <-  data.frame("yaslar" = c(23,24,26,28,29,30,34,24) ,
                 'cins' =  c('F','F','F','M','M','F','M','F'))
x

##Check structure
class(x)

##Check types
class(x$yaslar)
class(x$cins)
sapply(x,class)
##summarize
summary(x)

##Change type
x$cins <-  factor(x$cins)
#check
class(x$cins)
##Summarize again
summary(x)


##Install and call package

#install.packages('tidyr')
#install.packages('readr')
#install.packages('dplyr')
library(tidyr)
library(readr)
library(dplyr)

##Extract dataset

df <-  read.csv('https://raw.githubusercontent.com/HumayDS/Data-Analytics-with-R-spring/main/car.csv')



## EDA Explanotary Data Analysis

df %>%  head()
df %>%  glimpse()
str(df)

## check na's

is.na(df) %>%  sum()
sum(is.na(df))

colSums(is.na(df))


##Heading 

df %>%  head(5)

head(df, 5)

##Selecting 

df[10:15 ,  1:3]

df[, 3]


as.data.frame(df[, 3])


##Count rows
df %>%  nrow()

# Count of column

df %>% ncol()



# reset index
rownames(df) <-  seq(1: nrow(df))

##Sampling

sample_df <- sample_n(df , size = 200)
##Reset index
rownames(sample_df) <-  seq(1: nrow(sample_df))

##Getting column names
colnames(df)


# Rename a specific column
df <- df %>% rename(Odometer = Odometer..KM.)

##Check
df %>%  head()


summary(df)

sd(df$Price , na.rm = TRUE)
mean(df$Price, na.rm =  TRUE)


df$Make <-  factor(df$Make)
df$Colour <-  factor(df$Colour)
df$Doors <-  as.factor(df$Doors)


str(df)

##Getting correlation -- error 
cor(df)

##Select only numeric variables
numeric_data <- select_if(df, is.numeric)

###Correlation --- Error again
cor(numeric_data)


numeric_data <-  na.omit(numeric_data)

cor(numeric_data)

##Omit na's 
df_na <-  na.omit(df)

summary(df_na)

table(df$Doors)

table(df$Make)

table(df$Colour)


prop.table(table(df$Make)) 



numeric_data_2 <- select_if(df_na, is.numeric)
cor(numeric_data_2)


# Filtering

df %>% filter(Doors == 5) %>%  count()


df %>%  filter(Price > 20000)

df %>% filter((Price > 20000) | (Doors == 5))  #veya

df %>% filter((Price > 20000)  & (Odometer < 80000))  #ve





df %>%  select(Make , Price)


df_3 <-  df %>%  select(Make , Price) 


df %>%  select(Make , Price)  %>%   filter(Price > 20000)





hist(df$Price)

boxplot(df$Price)

##save dataset
write.csv(df,'data_123.csv', row.names = FALSE)



















