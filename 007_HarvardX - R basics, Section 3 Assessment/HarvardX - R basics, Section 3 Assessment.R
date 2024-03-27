library(dslabs)
library(dplyr)
data(heights)
options(digits = 3)    # report 3 significant digits for all answers

# Question 1
# First, determine the average height in this dataset. 
# Then create a logical vector ind with the indices for those individuals who are above average height.
# How many individuals in the dataset are above average height?

avg_h <- mean(heights$height)
ind <- heights$height > avg_h
sum(ind) 
# Output : 532

# Question 2
# How many individuals in the dataset are above average height and are female?

sum(heights$height > avg_h & heights$sex == 'Female')
# Output : 31

# Question 3
# What proportion of individuals in the dataset are female?

proportions(table(heights$sex))
# Output : 0.227


# Question 4
# This question takes you through three steps to determine 
# the sex of the individual with the minimum height.

# Question 4a
# Determine the minimum height in the heights dataset.

min_h <- min(heights$height)
min_h
# Output : 50

#Question 4b
#Use the match() function to determine the index of the first individual with the minimum height.

index <- match(min(heights$height), heights$height)
index
# Output : 1032

# Question 4c
# Subset the sex column of the dataset by the index in 4b to determine the individual’s sex.

heights$sex[index]
# Output : Male

# Question 5
# This question takes you through three steps to determine 
# how many of the integer height values between 
# the minimum and maximum heights are not actual heights of individuals in the heights dataset.

# Question 5a
# Determine the maximum height.

max_h <- max(heights$height)
max_h
# Output : 82.7

# Question 5b
# Which integer values are between the maximum and minimum heights? 
# For example, if the minimum height is 10.2 and the maximum height is 20.8, 
# your answer should be x <- 11:20 to capture the integers in between those values. 
# (If either the maximum or minimum height are integers, include those values too.)
# Write code to create a vector x that includes the integers between the minimum and maximum heights 
# in this dataset (as numbers).

x <- 50:82
# Output : x <- 50:82

# Question 5c
# How many of the integers in x are NOT heights in the dataset?
# Use the sum() and %in% functions in addition to the ! operator. 

sum(!x %in% heights$height)
# Output : 3

# Question 6
# Using the heights dataset, create a new column of heights in centimeters named ht_cm. 
# Recall that 1 inch = 2.54 centimeters. Save the resulting dataset as heights2.

heights <- mutate(heights, ht_cm = height*2.54)

# Question 6a
# What is the height in centimeters of the 18th individual (index 18)?

heights$ht_cm[18]
# Output : 163

# Question 6b
# What is the mean height in centimeters?

mean(heights$ht_cm)
# Output : 174

# Question 7
# Create a data frame females by filtering the heights2 data to contain only female individuals.

heights2 <- filter(heights, sex=='Female')

# Question 7a
# How many females are in the heights2 dataset?

nrow(heights2)
# Output : 238

# Question 7b
# What is the mean height of the females in centimeters?

min_h_f <- mean(heights2$ht_cm)
min_h_f
# Output : 165

#  Question 8
# The olive dataset in dslabs contains composition in percentage of eight fatty acids 
# found in the lipid fraction of 572 Italian olive oils:

data(olive)
head(olive)

# Plot the percent palmitic acid versus palmitoleic acid in a scatterplot. 
# What relationship do you see?

plot(olive$palmitic, olive$palmitoleic)
# Output : There is a positive linear relationship between palmitic and palmitoleic.

# Question 9
# Create a histogram of the percentage of eicosenoic acid in olive.
# Which of the following is true?

h = hist(olive$eicosenoic, plot=FALSE)
h$density = h$counts/sum(h$counts)*100
plot(h,freq=FALSE)

# Output : The most common value of eicosenoic acid is below 0.05%. 

# Question 10
# Make a boxplot of palmitic acid percentage in olive with separate distributions for each region.

boxplot(palmitic~region, data=olive)

# Which region has the highest median palmitic acid percentage?
# Output : Southern Italy

# Which region has the most variable palmitic acid percentage?
# Output : Southern Italy