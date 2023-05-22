#chapter 14 simple linear regression

#install the following packages
install.packages("readxl")

#load the packages into R
library(ggpubr)
library(tidyverse)
library("readxl")
theme_set(theme_pubr())

#step 1: import data into Rstudio
#step 1" import data using r studio
Child <- read_excel(file.choose())

summary(Child)
summary(model)

#gives us a snapshot of the excel file
head(Child)



#ANNOVA

boxplot(`Children Food Insecurity Population` ~ State, data = Child, main= "Children Food Insecurity in 4 Largest States in the US (2016-2020)",
        xlab = "State", ylab = "Children Insecurity Population")

summary(Child)

#Interpretation: the box plot gives us the visual summary of the data. It shows the median, 
#outliers, quartiles, maximum and minimum values. It is observed from the plot that the 
#median values of all four States (California, Flordia, New York and Texas) are different. We can see the 
#variation in the data from the boxplot, which shows us low within group variance for new york and california
#but a high within group variance for Florida and Texas
#There is normal distribution for for the state of New York 
#Also a low-among group variance between California, Florida, New York and Texas as you can see they don't overlap


# ANNOVA test and results

Child_anova <- aov(`Children Food Insecurity Population` ~ State, data = Child)
summary(Child_anova)


# checking assumptions
plot(Child_anova, 1)
# the p value is 6.23e-08. which is less than < 0.05

pairwise.t.test(Child$`Children Food Insecurity Population`,Child$State, p.adj = "bonferroni")

# Levenes test
library(car)
leveneTest(`Children Food Insecurity Population` ~ State, data = Child )
#not appropriate? check with professor?



#normal probability plot
plot(Child_anova, 2)

#Interpretation: You can see the majority of the points on the plot does follow a straight line, 
#so we can assume normality. But we can perform another test to confirm normality.

#the shapiro-wilk test on the ANOVA residuals is used to confirm normality
#Extract the residuals
Child_residual <- residuals(object = Child_anova)


#Figure 7: Shapiro-wilk normality test of Hunger Index
#run shapiro-wilk test
shapiro.test(x = Child_residual)
