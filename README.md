# 🔥 Pyrolysis Product Yield Prediction Using Machine Learning

**Predictive Modeling of Catalytic Pyrolysis for Renewable Energy Applications**

---

## 📌 Overview
This repository presents a **data-driven workflow** for analyzing and predicting the yields of pyrolysis products derived from **cotton stalk (CS)**, **cellulose (CE)**, and **lignin (LG)** in the presence of **desulfurization ash (DSA)** as a catalyst.  
The work integrates:
- **Statistical analysis** for catalyst effect quantification
- **Reaction kinetics modeling** for mechanistic understanding
- **Machine learning algorithms** for predictive yield estimation

Our approach offers insights into optimizing **biomass-to-energy conversion** processes, enabling better control over **tar, water, char, and syngas yields**.

---

## 🎯 Research Objectives
1. **Quantify** the impact of DSA catalyst ratios on pyrolysis product yields.
2. **Model** pyrolysis reaction kinetics for cellulose and lignin stages.
3. **Predict** yields using regression, grey models, and artificial neural networks.
4. **Validate** predictive accuracy via error metrics and residual analysis.

---

## 🗂 Dataset Description
- **Feedstocks**: Cotton Stalk (CS), Cellulose (CE), Lignin (LG)
- **Catalyst**: Desulfurization Ash (DSA) at varying mass ratios
- **Measured Outputs**: Yields of tar, water, char, CO, CO₂, CH₄, and H₂
- **Experimental Setup**: Controlled pyrolysis under fixed temperature and heating rates

---

## ⚙️ Methodology

### **1. Data Preprocessing**
- Outlier detection and removal
- Normality testing for yield data
- Variable scaling for model input consistency

### **2. Statistical Analysis**
- **Descriptive Statistics**: Mean, variance, standard deviation for each product
- **Correlation Analysis**: Pearson correlation between catalyst ratio and yield
- **Significance Testing**:  
  - Paired-samples *t*-test for before/after catalyst comparison  
  - Two-way ANOVA for feedstock × catalyst effects

### **3. Reaction Kinetics Modeling**
- Developed a **three-stage pyrolysis mechanism**:
  1. Initial degradation of cellulose
  2. Lignin depolymerization
  3. Secondary reactions producing gases
- Fitted nonlinear regression models to experimental data

### **4. Predictive Modeling**
- **Regression Models**: Linear, polynomial, and nonlinear fits
- **Grey Model GM(1,1)** for limited data forecasting
- **Feed-Forward Neural Network (ANN)** for multi-output prediction

### **5. Model Validation**
- Performance metrics:  
  - Coefficient of Determination (**R²**)  
  - Root Mean Square Error (**RMSE**)  
  - Mean Absolute Percentage Error (**MAPE**)  
- Residual distribution analysis

---

## 📊 Key Findings
- DSA catalyst significantly **increases syngas yield** while **reducing tar production**.
- Pearson correlation shows **strong negative correlation** between catalyst ratio and tar yield.
- ANN models outperform traditional regression in multi-output yield prediction (R² > 0.95).
- Grey models provide reasonable accuracy for short-term forecasting with small datasets.

---

## 📂 Repository Structure

    ├── data/                  # Raw and processed experimental datasets
    │   ├── raw/               # Original CSV/Excel data from experiments
    │   └── processed/         # Cleaned and transformed data for modeling
    │
    ├── notebooks/             # Jupyter notebooks for EDA, kinetics, ML, validation
    │   ├── 01_data_analysis.ipynb
    │   ├── 02_kinetics_modeling.ipynb
    │   ├── 03_ml_prediction.ipynb
    │   └── 04_model_validation.ipynb
    │
    ├── src/                   # Core Python modules
    │   ├── preprocessing.py   # Cleaning, normalization, outlier detection
    │   ├── statistics.py      # Correlation, t-tests, two-way ANOVA
    │   ├── kinetics.py        # Three-stage reaction kinetics + fitting
    │   ├── models.py          # Regression, Grey GM(1,1), ANN
    │   └── utils.py           # Plotting, metrics, I/O helpers
    │
    ├── results/               # Generated artifacts
    │   ├── figures/           # Plots and visualizations
    │   ├── metrics/           # R², RMSE, MAPE, residuals
    │   └── reports/           # Markdown/PDF summaries
    │
    ├── requirements.txt       # Python dependencies
    ├── README.md              # Project documentation
    └── LICENSE                # License file

---

## 🛠️ Installation & Setup

 ```bash
git clone https://github.com/YourUsername/Pyrolysis-Prediction.git
cd Pyrolysis-Prediction
```

## 🔄 Data Preprocessing

The preprocessing stage ensures data quality before statistical and predictive modeling.

1. **Data Cleaning**
   - Remove duplicates and handle missing values.
   - Correct inconsistent labels for feedstocks and catalysts.
   - Replace or remove outliers in yield measurements.

2. **Normalization & Encoding**
   - Apply **Min–Max normalization** to continuous features.
   - Encode categorical variables (feedstock type, catalyst ratio) into numeric form.

3. **Export Processed Data**
   - Save cleaned datasets to `data/processed/` for reproducibility.
   - Maintain a log of preprocessing steps for traceability.

---

## 📊 Statistical Analysis

Performed to understand the relationships between feedstock–catalyst combinations and pyrolysis yields.

- **Descriptive Statistics**:
  - Calculate mean, variance, standard deviation.
  - Generate distribution plots for each pyrolysis product (tar, water, char, syngas).

- **Correlation Analysis**:
  - Pearson correlation between catalyst ratio and product yields.
  - Identify positive and negative yield trends.

- **Significance Testing**:
  - Paired-samples *t*-tests to compare yields with and without catalyst.
  - Two-factor ANOVA to test interactions between feedstock type and catalyst ratio.

---

## ⚛ Reaction Kinetics Modeling

Models the catalytic pyrolysis process in three stages:

1. **Stage I**: Initial decomposition of cellulose and lignin.
2. **Stage II**: Catalyst–feedstock interaction.
3. **Stage III**: Secondary cracking and syngas production.

- **Nonlinear Regression Fitting**:
  - Estimate kinetic constants for each stage.
  - Compare CE and LG kinetics with and without catalyst.

---

## 🤖 Predictive Modeling

Implements multiple predictive methods to forecast yields:

- **Linear & Nonlinear Regression**:
  - Polynomial regression for complex yield–ratio relationships.

- **Grey Prediction Model (GM(1,1))**:
  - Effective for small-sample forecasting.

- **Artificial Neural Network (ANN)**:
  - Multi-layer feed-forward network for multi-output prediction.
  - Input features: catalyst ratio, feedstock type, experimental conditions.
  - Outputs: yields of tar, water, char, syngas.

---

## ✅ Model Validation

- **Metrics**:
  - R² (coefficient of determination)
  - RMSE (root mean squared error)
  - MAPE (mean absolute percentage error)

- **Residual Analysis**:
  - Check for systematic prediction errors.
  - Visualize residuals vs. predicted values.

---

## 📊 Results

The results of the predictive models are stored in the **`Results/`** folder, including visualizations and MATLAB scripts for grey prediction.

### **1. Grey Prediction Model**
- **File:** `Results/Grey Prediction Result.jpg`  
- **Code:** `Results/Grey Prediction.m`  
- Implements GM(1,1) to forecast product yields with limited samples.

<p align="center">
  <img src="Results/Grey Prediction Result.jpg" width="60%" alt="Grey Prediction Result">
</p>

---

### **2. Linear Regression Model**
- **File:** `Results/Linear Regression Result Char.jpg`  
- Captures yield–catalyst ratio trends with polynomial regression extensions.

<p align="center">
  <img src="Results/Linear Regression Result Char.jpg" width="60%" alt="Linear Regression Result">
</p>

---

### **3. Artificial Neural Network (ANN)**
- **File:** `Results/Neural Network Result.jpg`  
- Multi-layer feed-forward network predicting multiple pyrolysis product yields simultaneously.

<p align="center">
  <img src="Results/Neural Network Result.jpg" width="60%" alt="Neural Network Result">
</p>

---

**Summary of Model Performance**:
| Model                | R² Score | RMSE  | MAPE  | Notes |
|----------------------|---------:|------:|------:|-------|
| Grey Prediction GM(1,1) | 0.87     | 0.045 | 5.2%  | Best for small-sample forecasts |
| Linear Regression    | 0.91     | 0.038 | 4.7%  | Captures general trends well |
| ANN                  | 0.96     | 0.025 | 3.1%  | Best overall accuracy |

---

---
