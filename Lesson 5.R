#install.packages('lubridate')
library(readr)
library(dplyr)
library(lubridate)
library(dplyr)
#Todays date
##Date
Sys.Date()
today <-  Sys.Date()
today
class(today)
date1 = '06/06/2016'
class(date1)

date2 <-  as.Date(date1,format = '%d/%m/%Y' )
class(date2)


##TIME

Sys.time()


##create sequence
seq(from =1 , to = 100, by = 5)

seq(from = as.Date('12/12/2020' , format = '%d/%m/%Y') ,
    to = as.Date('22/12/2020' , format = '%d/%m/%Y') , by = 1)

seq(from = as.Date('12/12/2020' , format = '%d/%m/%Y') ,
    to = as.Date('22/12/2022' , format = '%d/%m/%Y') , by = 'month')




##Read dataset

df <-  read_csv('https://raw.githubusercontent.com/HumayDS/Data-Analytics-with-R-spring/main/datedata.csv')

df %>%  head()
df %>%  glimpse()

df <-  df %>%  select(-...1 )

df %>%  glimpse()
df %>% is.na() %>% sum()

#check uniques

unique(df$StockCode)
unique(df$Country)
unique(df$Description)

#convert type
df$InvoiceDate <-  as.Date(df$InvoiceDate)

df$Country <-  as.factor(df$Country)
df$Customer.ID <-  as.character(df$Customer.ID)
df %>%  glimpse()

#get differences between days 

df$dayDifference <- as.numeric(difftime(Sys.Date(), df$InvoiceDate, units = "days"))

#Arrange by Date
df %>% arrange(InvoiceDate)

#get min and max date


min(df$InvoiceDate)
max(df$InvoiceDate)

length(df$InvoiceDate)
unique(df$InvoiceDate)

#filter by date

filtered_df <- df %>%
  filter(InvoiceDate > as.Date("2010-04-06"))

filtered_df2 <- df %>%
  filter(InvoiceDate > as.Date("2010-02-28") & InvoiceDate < as.Date("2011-07-01"))

##extraxt year, month,day

df$month<- month(df$InvoiceDate,label = TRUE)
df$week<- week(df$InvoiceDate)
df$year<-year (df$InvoiceDate)
df$day<-day(df$InvoiceDate)
df$weekday<-weekdays(df$InvoiceDate)

##Sys.setlocale("LC_TIME", "en_US.UTF-8")

#filter year == 2010

df %>%
  filter(year(InvoiceDate) == 2010)

df %>%  filter(year == 2011)

#mean
df %>%
  group_by(year) %>%
  summarise(mean_quantity = mean(Quantity))



# group by monthly and weekly
for_monthly<- df %>% group_by(month,year) %>% 
  summarise(sales= sum(Quantity,na.rm = TRUE)) %>% arrange(year,month)


for_weekly<- df %>% group_by(month,year, week) %>% 
  summarise(sales= sum(Quantity,na.rm = TRUE)) %>% arrange(year,month)












