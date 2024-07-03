# Load necessary libraries
library(survival)

# Load data
BreastCancer <- read.csv("data/ProcessedBreastCancer.csv")

# Kaplan-Meier
surv_object <- Surv(time = BreastCancer$time, event = BreastCancer$event)
kaplan_meier <- survfit(surv_object ~ 1, data = BreastCancer)

# Cox regression
cox_model <- coxph(Surv(time, event) ~ ., data = BreastCancer)
summary(cox_model)

# Compare Kaplan-Meier and Cox regression
plot(kaplan_meier, conf.int = FALSE, col = "black", main = "Comparison of Model Fits",
     xlab = "Time (days)", ylab = "Survival Probability")
lines(survfit(cox_model, newdata = BreastCancer), col = "red")
legend(x = 700, y = 1, legend = c("Kaplan-Meier", "Cox-PH"), lty = 1,
       col = c("black", "red"), cex = 1, bty = "n")
