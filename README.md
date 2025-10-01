# Statistical Insights: Optimizing Retail Training, Property Investments, Insurance Pricing, and Loan Risk Management

## 🎯 Project Description
This repository presents a full SAS statistical analysis from the "Data Analytics Tools and Techniques" Assignment 2 (January 2025, submitted April 3, 2025). Conducted by Group 16, it addresses four interconnected business challenges using real-world datasets:

1. **Cosmetics Sales Training (Q1)**: Paired t-test and Wilcoxon signed-rank test on 40 UK stores' data to assess training impact on male-targeted Christmas sales. Non-parametric results show significant uplift (£50.95 avg.), despite parametric non-significance due to non-normality.
2. **Pub Property Valuation (Q2)**: Multiple linear regression on 40 properties, tackling multicollinearity (VIF>7 for House/Otherarea/Garden), model selection (forward/backward/Cp), diagnostics (residuals, leverage, DFBETAS), and predictions. Final model (Pubs + Employ) explains 39.6% variance; advises against £515K "Good King James" purchase (max viable: £408K at 95% CI).
3. **Travel Insurance Claims (Q3)**: Bivariate regression on log-transformed claims (n=36 ages 50-85). Log model (R²=0.99) outperforms linear (R²=0.99 but heteroscedastic); predicts £689 avg. claim for 70-year-olds with narrow 95% CI.
4. **Loan Delinquency Analysis (Q4)**: Chi-square test on short-term loans; younger borrowers (18-30) show 17.67% late payments vs. 11.33% for >30 (p=0.0276, diff CI: 0.72%-11.95%). Recommends age-tiered risk policies.

Emphasizes practical interpretation, model validation, and decision-making for retail, hospitality, insurance, and banking sectors. Total: 200 marks (Q1:40, Q2:85, Q3:35, Q4:25, Presentation:15); 60% module contribution.

## 📊 Key Techniques & Tools
- **Software**: SAS (import, PROC UNIVARIATE/MIXED/REG/LOGISTIC, ODS graphics).
- **Statistical Methods**:
  - Hypothesis Testing: Paired t-test, Wilcoxon signed-rank, Sign test, Chi-square.
  - Regression: Multiple (selection: forward/backward/Cp), Bivariate (linear/log), Diagnostics (VIF, studentized/deleted residuals, Cook's D, Leverage H, DFBETAS, CovRatio).
  - Validation: QQ plots, histograms, scatterplots, normality checks.
- **Datasets**:
  - `cosmetics.sas7bdat`: Sales (40 stores).
  - `pubvalues.sas7bdat`: Properties (40 pubs).
  - `travel.sas7bdat`: Claims (ages 50-85).
  - `loans.sas7bdat`: Delinquencies (age groups; assumed based on Q4).

## 🗂️ Repository Structure
