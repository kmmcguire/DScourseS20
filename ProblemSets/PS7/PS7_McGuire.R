library(mice)
library(stargazer)
library(tidyr)
library(gtools)
library(dplyr)

wages = read.csv("~/DScourseS20/ModelingOptimization/wages.csv")
wages = drop_na(wages, hgc, tenure)

stargazer(wages)

#Regression Model 1
wages_MCAR = drop_na(wages)
wages_MCAR_r <- lm(logwage ~ hgc + college + tenure + tenure^2 + age + married, data = wages_MCAR)

#Regression Model 2
wages_MI_c = na.replace(wages$logwage, (sum(wages$logwage,na.rm=TRUE)/1669))
wages_MI <- data.frame(wages_MI_c, wages$hgc, wages$college, wages$tenure, wages$age, wages$married)
colnames(wages_MI) <- c("logwage","hgc","college","tenure","age","married")
wages_MI_r <- lm(logwage ~ hgc + college + tenure + tenure^2 + age + married, data = wages_MI)

#Regression Model 3
wages_MAR = wages
wages_MAR$college <- as.character(wages_MAR$college)
wages_MAR$college[wages_MAR$college == "college grad"] <- 0
wages_MAR$college[wages_MAR$college == "not college grad"] <- 1
wages_MAR$married <- as.character(wages_MAR$married)
wages_MAR$married[wages_MAR$married == "married"] <- 0
wages_MAR$married[wages_MAR$married == "single"] <- 1
wages_MAR$college <- as.numeric(wages_MAR$college)
wages_MAR$married <- as.numeric(wages_MAR$married)

wages_MAR_c = na.replace(wages_MAR$logwage, 0.6385419 + 0.06181551*wages_MAR$hgc + 0.1464113*wages_MAR$college + 0.02339587*wages_MAR$tenure - 0.0006991874*wages_MAR$age - 0.02382149*wages_MAR$married)
wages_MAR_d <- data.frame(wages_MAR_c, wages$hgc, wages$college, wages$tenure, wages$age, wages$married)
colnames(wages_MAR_d) <- c("logwage","hgc","college","tenure","age","married")
wages_MAR_r <- lm(logwage ~ hgc + college + tenure + tenure^2 + age + married, data = wages_MAR_d)

#Ouput
stargazer(wages_MCAR_r,wages_MI_r,wages_MAR_r)
#Regression Model 4
wages_mice = wages
data("wages_mice")
wages_mice.imp = mice(wages_mice, seed = 12345)
summary(wages_mice.imp)
fit = with(wages_mice.imp, lm(logwage ~ hgc + college + tenure + tenure^2 + age + married))
