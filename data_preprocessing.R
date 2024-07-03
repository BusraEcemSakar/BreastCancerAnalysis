# Load necessary libraries
library(dplyr)

# Load data
BreastCancer <- read.csv("data/BreastCancer.csv")

# Data preprocessing
BreastCancer$BirthControlPillUse <- factor(BreastCancer$BirthControlPillUse, levels = c("1", "2"), labels = c("Yes", "No"))
BreastCancer$TumorDiagnosis <- factor(BreastCancer$TumorDiagnosis, levels = c("1", "2"), labels = c("Early", "Late"))
BreastCancer$NeoadjuvantUse <- factor(BreastCancer$NeoadjuvantUse, levels = c("1", "2"), labels = c("Yes", "No"))

# Save processed data
write.csv(BreastCancer, "data/ProcessedBreastCancer.csv", row.names = FALSE)
