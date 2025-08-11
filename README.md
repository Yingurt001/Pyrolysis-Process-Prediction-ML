# 🔥 Pyrolysis Process Prediction with Machine Learning  

**A Data-Driven Framework for Catalytic Pyrolysis Yield Prediction and Reverse Chemical Product Inference**  

---

## 📌 Overview  

This repository provides a complete workflow for analyzing and predicting the yields of pyrolysis products from **cotton stalk (CS)**, **cellulose (CE)**, and **lignin (LG)** in the presence of a **desulfurization ash (DSA)** catalyst.  
The project integrates **statistical modeling**, **reaction kinetics analysis**, and **machine learning** to uncover reaction mechanisms and improve the efficiency of renewable energy production from biomass.  

---

## 🚀 Key Features  

- **Descriptive Statistical Analysis**  
  - Computation of mean, variance, and yield distributions for pyrolysis products.  
  - Trend visualization for tar, water, char, and syngas yields.  

- **Correlation Analysis**  
  - Pearson correlation coefficients between catalyst loading ratio and product yields.  

- **Significance Testing**  
  - Paired-sample *t*-tests and two-factor ANOVA to assess catalyst impact.  

- **Reaction Kinetics Modeling**  
  - Three-stage pyrolysis mechanism modeling for CE and LG.  
  - Nonlinear regression fitting to derive kinetic parameters.  

- **Predictive Modeling**  
  - Linear and nonlinear regression models.  
  - Grey Prediction Model (GM).  
  - Feed-Forward Neural Network (ANN) for complex pattern learning.  

- **Visualization**  
  - Scatter plots, line charts, and stacked plots for product yield trends and gas composition.  

---

## 🧪 Methodology  

1. **Data Preprocessing**  
   - Outlier detection, missing value handling, and normality testing.  
   - Standardization of measurement units and data formats.  

2. **Statistical Analysis**  
   - Descriptive statistics for yield variations across catalyst ratios.  
   - Correlation analysis to identify significant relationships between variables.  

3. **Kinetics Modeling**  
   - Construction of three-stage pyrolysis reaction mechanisms.  
   - Nonlinear regression to fit kinetic constants for CE and LG degradation pathways.  

4. **Predictive Modeling**  
   - Implementation of multiple regression approaches (linear, polynomial).  
   - Grey system modeling for small-sample prediction.  
   - ANN for multi-variable nonlinear mapping and yield forecasting.  

5. **Model Validation**  
   - Performance metrics: **R²**, **RMSE**, and residual diagnostics.  
   - Comparative analysis across models to select the most robust predictor.  

---

## 📂 Project Structure  

```bash
├── data/                      # Experimental and preprocessed datasets
├── analysis/                  # Statistical analysis scripts
├── kinetics_modeling/         # Reaction kinetics fitting and simulation
├── prediction_models/         # Regression, grey model, and ANN scripts
├── results/                   # Plots and output files
├── LICENSE
├── README.md
```

If you use this work, please cite:
Ying Zhang, Tianhao Hua, Yuzhi Zheng. Pyrolysis Process Prediction with Machine Learning. 2024.

<div align="center"> <b>⭐ If you find this project useful, please consider giving it a star!</b> <br> <em>From catalyst ratios to yield forecasts — accelerating biomass energy research with data-driven modeling.</em> </div> ```
