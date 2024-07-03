# Load necessary libraries
library(survival)
library(ggplot2)
library(survminer)

# Load data
BreastCancer <- read.csv("data/ProcessedBreastCancer.csv")

# Kaplan-Meier analysis
surv_object <- Surv(time = BreastCancer$time, event = BreastCancer$event)
kaplan_meier <- survfit(surv_object ~ 1, data = BreastCancer)
plot(kaplan_meier, col = "Red", xlab = "Days", ylab = "Survival Probability", main = "Kaplan-Meier Curve", mark.time = TRUE)
legend(x = 500, y = 1, lty = 1, col = "Red", cex = 0.95, bty = "n")

# Save plot
ggsave("output/kaplan_meier_plot.png")

# Log-rank tests
log_rank_tumor <- survfit(surv_object ~ TumorDiagnosis, data = BreastCancer)
ggsurvplot(log_rank_tumor, data = BreastCancer, pval = TRUE, xlab = "Time (days)", ylab = "Survival Probability",
           legend.title = "Tumor Diagnosis", legend.labs = c("Early Stage", "Late Stage"))

log_rank_birth_control <- survfit(surv_object ~ BirthControlPillUse, data = BreastCancer)
ggsurvplot(log_rank_birth_control, data = BreastCancer, pval = TRUE, xlab = "Time (days)", ylab = "Survival Probability",
           legend.title = "Birth Control Pill Use", legend.labs = c("Yes", "No"))

log_rank_neoadjuvant <- survfit(surv_object ~ NeoadjuvantUse, data = BreastCancer)
ggsurvplot(log_rank_neoadjuvant, data = BreastCancer, pval = TRUE, xlab = "Time (days)", ylab = "Survival Probability",
           legend.title = "Neoadjuvant Use", legend.labs = c("Yes", "No"))

# Save plots
ggsave("output/log_rank_tumor.png")
ggsave("output/log_rank_birth_control.png")
ggsave("output/log_rank_neoadjuvant.png")
