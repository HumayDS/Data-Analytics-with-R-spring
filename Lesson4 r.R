
##Set your working directory
getwd()
setwd()



##Install and call package

#install.packages('tidyr')
#install.packages('readr')
#install.packages('dplyr')
##ACtivate packages 
library(tidyr)
library(readr)
library(dplyr)

##Import dataset

df <- read.csv('https://raw.githubusercontent.com/HumayDS/Data-Analytics-with-R-spring/main/car2.csv')

df %>%  head()

df %>%  glimpse()
df %>%  summary()


## check na's

is.na(df) %>%  sum()


#Check na by columns 
colSums(is.na(df))


##Change typ
df$Make <-  factor(df$Make)
df$Colour <-  factor(df$Colour)
df$Doors <-  as.factor(df$Doors)

df %>%  glimpse()




## Check uniques 

table(df$Doors)

table(df$Make)

table(df$Colour)

prop.table(table(df$Make)) 

##Getting column names
colnames(df)

# Rename a specific column
df <- df %>% rename(Odometer = Odometer..KM.)

# Filtering


##Filter where doors == 5
df %>% filter(Doors == 5)

df %>% filter(Doors == 5) %>%  count()
##mFilter rows contain na values 

df %>%  filter(Price > 20000)

df %>% filter((Price > 20000) | (Doors == 5))  #veya

df %>% filter((Price > 20000)  & (Odometer < 80000))  #ve

##Select 


df %>%  select(Make , Price)


df_3 <-  df %>%  select(Make , Price) 


df %>%  select(Make , Price)  %>%   filter(Price > 20000)


## Select slice

df %>%  select(Make,Price) %>%  slice(20:40)
## Rearrange columns 
df %>%  select(Price, Doors , everything())
df <- df %>%  select(Price, Doors , everything())
## Delete columns 
df <-  df %>%  select(-X)

##get indexes 
index  <-  which(is.na(df$Price))
index

##show rows contain na
df[index, ]

## delete na's
df_na_omit <- na.omit(df)

## df mean imputation  Price

mean(df$Price , na.rm = T)
mean <-  mean(df$Price , na.rm = T)


df_clear <-  df 

df_clear$Price[index] <-  mean 

## df mode  imputation  Price

df_clear$Colour[is.na(df_clear$Colour)] <-  'White'

is.na(df_clear) %>%  sum() 



write.csv(df_clear, 'df.csv')

##Grouping
#mean
df_clear %>%
  group_by(Doors) %>%
  summarise(mean_price = mean(Price))

##Sum
df_clear %>%
  group_by(Make) %>%
  summarise(sum_price = sum(Price)) %>%  arrange(desc(mean_price))

#count


df_clear %>%
  group_by(Make) %>%
  summarise(count = n())


##mean and dsum


df_clear %>%
  group_by(Doors) %>%
  summarise(mean_price = mean(Price) , sum_price = sum(Price))



hist(df$Price)
boxplot(df$Price)

df_2 <- df_clear %>%   filter(Price < 40000)


hist(df_2$Price)
boxplot(df_2$Price)

##Mutate 

df_clear %>%  head()

df_clear %>%  mutate(Price = Price*0.9)
df_clear %>%  mutate(Price90 = Price*0.9)
df_clear %>%  mutate(division =  Odometer/Price)
df_clear %>%  mutate(division =  Odometer/Price ,Price90 = Price*0.9 )

df_clear %>%  mutate(Doors  = case_when(  Price >  160000 ~ "Expensive",
                                     TRUE ~ "Cheap"
)) 


###  nested func 

df_clear %>%  select(Make, Price) %>% 
  rename('Marka' = 'Make' , 'Qiymet' = 'Price') %>% 
    group_by(Marka) %>%  summarise(Orta = mean(Qiymet)) %>%  
    mutate(orta90 = Orta*0.90) %>%  arrange(desc(Orta))




##SCaling 
df_clear %>% 
  mutate(Price  =  scale(Price) , Odometer = scale(Odometer))

df_scaling <- df_clear %>%  
  mutate(Price  =  scale(Price) , Odometer = scale(Odometer))

df_scaling %>%  head()
##log transform


df_log <- df_clear %>%  
  mutate(Price  =  log1p(Price) , Odometer = log1p(Odometer))

head(df_log)


##
##Select only categoric variables 
categoric_df <- df_scaling %>%
  select(where(is.factor))

categoric_df

##Select only numeric variables

numeric_vars <- df_scaling %>%
  select(where(is.numeric))



### One hot Encoding-- dummy variables


# Perform one-hot encoding
dmy <- model.matrix(~ . - 1, data = categoric_df)
dmy_df <- as.data.frame(dmy)

df_clear <- cbind(numeric_vars, dmy_df)
df_clear






