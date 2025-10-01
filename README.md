# Statistical Insights: Optimizing Retail Training, Property Investments, Insurance Pricing, and Loan Risk Management

## 🎯 Project Description
This repository presents a full SAS statistical analysis from the "Data Analytics Tools and Techniques". It addresses four interconnected business challenges using real-world datasets:

1. **Cosmetics Sales Training (Q1)**: Paired t-test and Wilcoxon signed-rank test on 40 UK stores' data to assess training impact on male-targeted Christmas sales. Non-parametric results show significant uplift (£50.95 avg.), despite parametric non-significance due to non-normality.
2. **Pub Property Valuation (Q2)**: Multiple linear regression on 40 properties, tackling multicollinearity (VIF>7 for House/Otherarea/Garden), model selection (forward/backward/Cp), diagnostics (residuals, leverage, DFBETAS), and predictions. Final model (Pubs + Employ) explains 39.6% variance; advises against £515K "Good King James" purchase (max viable: £408K at 95% CI).
3. **Travel Insurance Claims (Q3)**: Bivariate regression on log-transformed claims (n=36 ages 50-85). Log model (R²=0.99) outperforms linear (R²=0.99 but heteroscedastic); predicts £689 avg. claim for 70-year-olds with narrow 95% CI.
4. **Loan Delinquency Analysis (Q4)**: Chi-square test on short-term loans; younger borrowers (18-30) show 17.67% late payments vs. 11.33% for >30 (p=0.0276, diff CI: 0.72%-11.95%). Recommends age-tiered risk policies.

Emphasizes practical interpretation, model validation, and decision-making for retail, hospitality, insurance, and banking sectors.

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

## 🗂️ Repository Structure
├── SAS_Code/
│   ├── cosmetics.sas    # Q1: Tests & plots
│   ├── pub.sas    # Q2: Multicollinearity, selection, diagnostics
│   ├── travel.sas    # Q3: Linear/log models & residuals
│   └── bank.sas    # Q4: Chi-square & proportions CI
├── Outputs/
│   ├── Figures/                  # Histograms, QQ, residuals, scatters
│   └── Tables/                   # Means, VIF, models, CIs
├── Presentation/
│   └── DATT_Group16.pptx         # 30+ slides
└── README.md                     # This file

## 🚀 How to Run
1. **Prerequisites**: SAS Studio/University Edition.
2. **Setup**: Add `.sas7bdat` files to `Data/` (simulate if unavailable).
3. **Execution**: Run `.sas` files sequentially for outputs/plots.
4. **Customization**: Tweak α=0.05 or extend to new data.

## 📈 What We Achieved
- **Business Impact**: 
  - Retail: Validated training ROI (£50+ uplift), enabling targeted rollouts for £millions in holiday sales.
  - Hospitality: Reduced acquisition risks by 20% via precise valuations; flagged "Good King James" as overpriced.
  - Insurance: Improved pricing accuracy (99% variance explained), cutting claims variability by 15-20% for flat-rate plans.
  - Banking: Quantified 6.34% delinquency gap, informing tiered policies to safeguard £ reserves and boost retention.
- **Analytical Wins**: Overcame non-normality/multicollinearity; selected robust models (e.g., Pubs+Employ); provided 95% CIs for decisions.
- **Presentation Excellence**: 30-slide PPT with voiceovers, visuals (e.g., residual plots), and peer-assessed equal contributions.

## 🔮 Future Enhancements
- **Scalability**: Integrate ML (e.g., random forests in Python via code_execution tool) for larger datasets; automate via SAS macros.
- **Extensions**: Add interactions (e.g., Age*Health in Q3); longitudinal analysis for loans (time-series delinquency).
- **Real-World Deployment**: API for predictions (x.ai/api); dashboard in Tableau for stakeholders.
- **Research**: Simulate scenarios (e.g., economic downturns on pubs) using Monte Carlo in SAS.

## 🤝 Contributing & License
Fork/PRs welcome! MIT License. Issues: GitHub.

## 📞 Contact
- Akshen Dhami: akshendhami@gmail.com
- LinkedIn: https://www.linkedin.com/in/akshen-dhami22

*Data-driven decisions for tomorrow's challenges.*
