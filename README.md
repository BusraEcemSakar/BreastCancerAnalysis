
# 🧬 Breast Cancer Analysis

This project involves analyzing survival times and associated factors for breast cancer patients using various statistical and machine learning techniques. The analysis is based on data from a 2017 study by Awodutire, Kolawole, and Ilori, published on the Mendeley Data platform.

---

## 📚 Research Project

This project is part of a research study utilizing data from Awodutire, Kolawole, and Ilori's 2017 work, published on the Mendeley Data platform. The dataset contains information from 89 breast cancer patients. You can find the full reference for the data at DOI: [10.13140/RG.2.2.17357.41440](https://doi.org/10.13140/RG.2.2.17357.41440).

---

## 📂 Project Structure

```plaintext
BreastCancerAnalysis/
│
├── data/
│   ├── BreastCancer.csv            # Original dataset
│   └── ProcessedBreastCancer.csv    # Processed dataset for analysis
├── scripts/
│   ├── data_preprocessing.R         # Data preprocessing script
│   ├── descriptive_statistics.R     # Generates descriptive statistics
│   ├── survival_analysis.R          # Kaplan-Meier survival analysis
│   ├── model_comparison.R           # Compares Kaplan-Meier and Cox regression models
│   └── random_forest_analysis.R     # Random forest survival analysis and comparison
├── output/
│   └── ...                          # Output files and plots generated by the scripts
└── BreastCancerAnalysis.Rproj       # R project file
```

---

## ⚙️ How to Run

1. **Clone the repository**:
   ```bash
   git clone https://github.com/BusraEcemSakar/BreastCancerAnalysis.git
   cd BreastCancerAnalysis
   ```

2. **Open the R project file**:
   Open `BreastCancerAnalysis.Rproj` in RStudio.

3. **Run the scripts**:
   Source each script in the `scripts/` directory to run the analysis step by step.

---

## 📝 Analysis Summary

### Data Preprocessing
- The dataset is loaded and preprocessed, with relevant columns converted to factors.

### Descriptive Statistics
- Generates summary statistics and frequency tables for the dataset.

### Survival Analysis
- Kaplan-Meier survival curves are plotted.
- Log-rank tests are performed for different categorical variables.

### Model Comparison
- Compares Kaplan-Meier and Cox regression models.

### Random Forest Analysis
- A random forest survival model is trained and evaluated.
- Prediction error curves and concordance indices are computed to compare models.

---

## 📊 Results and Recommendations

In this study, data from 89 breast cancer patients were used, based on the work of Awodutire, Kolawole, and Ilori (2017) on Mendeley Data. The patients' survival times were right-censored one year after diagnosis. The recorded survival time spans from the day of diagnosis to the last contact (death, alive, or loss to follow-up) and is measured in days. Variables that could affect the patient's survival time include age, age at menarche, birth control pill use, average breastfeeding years, tumor stage at diagnosis, and use of neoadjuvant therapy.

### Key Findings
- Of the 89 patients, 57.3% (n=51) experienced the event (death). The Kaplan-Meier survival curve shows deaths occurred within the first 329 days, with no significant changes in survival rate during subsequent follow-up. The median survival time was 251±52.82 days [95% CI: 147.5-354.5 days], with a survival rate above 0.60 in the first 4 months.
- **Log-rank test results**:
  - No statistically significant difference in survival between early-stage and late-stage tumor groups (p=0.163).
  - No statistically significant difference in survival based on birth control pill use (p=0.242).
  - No statistically significant difference in survival based on neoadjuvant therapy (p=0.143).
- **Cox Regression Model**:
  - No statistically significant effects on hazard ratio for age, age at menarche, breastfeeding years, birth control pill use, or tumor stage.
  - Neoadjuvant therapy showed a statistically significant effect (p<0.05), with patients not receiving neoadjuvant therapy having a 0.5 times lower risk of death.
  - C-Index for the Cox model was 0.648.
- **Random Survival Forest**:
  - Identified breastfeeding years as the most important variable, followed by birth control pill use.
  - C-Index for the random forest model was 0.60.

Increasing the sample size in future studies could improve both modeling and variable identification. This analysis shows that the random forest method does not necessarily outperform the Cox regression method. Further studies with larger datasets could help validate these findings.

--- 

Feel free to explore and expand on the project as needed!
