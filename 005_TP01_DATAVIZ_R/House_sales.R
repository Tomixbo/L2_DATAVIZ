rm(list = ls())
gc()

#import
df<-read.csv(file='C:/Users/ASUS_TMX/Documents/R project/kc_house_data_NaN.csv')

#head
head(df)

#types
str(df)

#summary
summary(df)

#drop column "x'
df=df[,3:22]

#missing values bedrooms
sum(is.na(df$bedrooms))

##missing values bathrooms
sum(is.na(df$bathrooms))

#replace NA with mean - bedrooms
df$bedrooms[is.na(df$bedrooms)] <- mean(df$bedrooms, na.rm = TRUE)

#replace NA with mean - bathrooms
df$bathrooms[is.na(df$bathrooms)] <- mean(df$bathrooms, na.rm = TRUE)

#count unique floor
table(df$floors)

#boxplot waterfront price
df$waterfront
boxplot(price~waterfront,col = "green", data=df)

#correlation with price
cor(df$price, df[3:20])


