# Load necessary libraries
library(dplyr)
library(survival)
library(ggplot2)
library(ggfortify)
library(randomForestSRC)
library(epiDisplay)
library(doMC)
library(pec)
library(Rcpp)

# Load data
BreastCancer <- read.csv("data/BreastCancer.csv")

# Data preprocessing
BreastCancer$DogumKontrolHapiKull <- factor(BreastCancer$DogumKontrolHapiKull, levels = c("1", "2"), labels = c("Evet", "Hayır"))
BreastCancer$TümörTani <- factor(BreastCancer$TümörTani, levels = c("1", "2"), labels = c("Evet", "Hayır"))
BreastCancer$NeoadjuvanKull <- factor(BreastCancer$NeoadjuvanKull, levels = c("1", "2"), labels = c("Evet", "Hayır"))

# Save processed data
write.csv(BreastCancer, "data/ProcessedBreastCancer.csv", row.names = FALSE)
