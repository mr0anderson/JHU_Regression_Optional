# week 3 optional assignment

setwd("~/Documents/R/Regression")
install.packages("devtools")
devtools::install_github("jhudsl/collegeIncome")
library(collegeIncome)
data(college)
devtools::install_github("jhudsl/matahari")
library(matahari)
dance_start(value = FALSE, contents = FALSE)

#Question: Based on your analysis, would you 
#conclude that there is a significant association between college major category and income?
data(college)

#major_category
#median

cat <- college$major_category
earn <- college$median
df <- data.frame(cat, earn)
head(df)
agg <- aggregate(df$earn ~ df$cat, df, mean)
agg <- agg[order(agg$`df$earn`, decreasing = TRUE),]
agg

df$cat <- relevel(df$cat, ref = "Interdisciplinary")
fit <- lm(df$earn ~ df$cat)
summary(fit)
boxplot(df$earn ~  df$cat, las = 2)

dance_save("college_major_analysis.rds")
