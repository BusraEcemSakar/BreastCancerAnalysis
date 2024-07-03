# Load necessary libraries
library(epiDisplay)

# Load data
BreastCancer <- read.csv("data/ProcessedBreastCancer.csv")

# Descriptive statistics
summary_stats <- summary(BreastCancer)
write.csv(summary_stats, "output/summary_stats.csv")

# Frequency tables
tab1(BreastCancer$BirthControlPillUse, sort.group = "decreasing", cum.percent = TRUE)
tab1(BreastCancer$TumorDiagnosis, sort.group = "decreasing", cum.percent = TRUE)
tab1(BreastCancer$NeoadjuvantUse, sort.group = "decreasing", cum.percent = TRUE)
tab1(BreastCancer$event, sort.group = "decreasing", cum.percent = TRUE)
