# Load necessary libraries
library(randomForestSRC)
library(survival)
library(doMC)
library(pec)

# Load data
BreastCancer <- read.csv("data/ProcessedBreastCancer.csv")

# Split data into training and validation sets
set.seed(800)
train_idx <- sample(nrow(BreastCancer), 0.7 * nrow(BreastCancer), replace = FALSE)
TrainSet <- BreastCancer[train_idx, ]
ValidSet <- BreastCancer[-train_idx, ]

# Random forest survival model
fit_formula <- Surv(time, event) ~ Age + MenarcheAge + AvgBreastFeedingYears + BirthControlPillUse + TumorDiagnosis + NeoadjuvantUse
set.seed(123)
fit <- rfsrc(fit_formula, data = TrainSet, ntree = 80, splitrule = "logrank", importance = TRUE)
plot(fit)
ggsave("output/random_forest_fit.png")

# Prediction error curve
registerDoMC()
set.seed(692)
fitpec <- pec(list("CPH" = cox_model, "RSF" = fit), data = BreastCancer, formula = fit_formula,
              splitMethod = "cv10", B = 6, keep.index = TRUE, keep.matrix = TRUE)
plot(fitpec, what = "crossvalErr", xlim = c(0, 1022), legend = FALSE)
legend(x = 890, y = 0.30, legend = c("KM", "CPH", "RSF"), lty = 1,
       col = c("black", "red", "green"), bty = "n", cex = 1, lwd = 2)
title("Comparison of Prediction Error Curves", line = 1, cex = 6)
ggsave("output/prediction_error_curves.png")

# Concordance index
start_time <- Sys.time()
set.seed(692)
ApparentCindex <- cindex(list("Cox" = cox_model, "RSF" = fit), formula = fit_formula,
                         data = BreastCancer, eval.times = seq(1, 1022, 1))
end_time <- Sys.time()
total_run_time <- end_time - start_time
print(total_run_time)

plot(ApparentCindex, legend = FALSE, xlim = c(0, 1000), ylim = c(0, 1.0), col = c("red", "green"))
legend(x = 800, y = 1, legend = c("CPH", "RSF"), lty = 1, col = c("red", "green"), bty = "n", cex = 1, lwd = 2)
title("Comparison of Concordance", line = 1, cex = 6)
ggsave("output/concordance_comparison.png")
