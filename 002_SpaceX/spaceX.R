#library
library('purrr')
library('ggplot2')
library('fastDummies')
library('float')

#set working directory
setwd("C:/Users/ASUS_TMX/Documents/R project/")

#read dataframe
df=read.csv("./dataset_part_2.csv")

# Exploratory Data Analysis
head(df,5)

# TASK 1: Visualize the relationship between Flight Number and Launch Site
ggplot(df, aes(x=FlightNumber, y=LaunchSite, color=Class))+geom_point()+scale_colour_continuous(low="yellow", high="red")

# TASK 2: Visualize the relationship between Payload and Launch Site
ggplot(df, aes(x=PayloadMass, y=LaunchSite, color=Class))+geom_point()+scale_colour_continuous(low="blue", high="green")

# TASK  3: Visualize the relationship between success rate of each orbit type
class_means_df <- setNames(
  aggregate(Class ~ Orbit, df, mean),
  c("Orbit_group", "Class_mean")
)

ggplot(class_means_df, aes(x=Orbit_group))+geom_col(aes(y=Class_mean, fill=Class_mean),data=class_means_df)+scale_fill_continuous(low="blue", high="green")

# TASK  4: Visualize the relationship between FlightNumber and Orbit type
ggplot(df, aes(x=FlightNumber, y=Orbit, color=Class))+geom_point()+scale_colour_continuous(low="yellow", high="red")

# TASK  5: Visualize the relationship between Payload and Orbit type
ggplot(df, aes(x=PayloadMass, y=Orbit, color=Class))+geom_point()+scale_colour_continuous(low="blue", high="green")

# TASK  6: Visualize the launch success yearly trend
df2<-df
df2$Year<-strftime(df$Date, "%Y")
df_aggr<-aggregate(Class~Year, df2, FUN=mean)
ggplot(df_aggr, aes(x=Year, y=Class, group=1))+geom_line(colour="blue")+geom_point()

# TASK  7: Create dummy variables to categorical columns
df_one_hot <- dummy_cols(df, select_columns = c('Orbit', 'LaunchSite', 'LandingPad', 'Serial'),
                      remove_selected_columns = FALSE)
head(df_one_hot)
