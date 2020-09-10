# 1.Real Estate Data Analysis and Machine Learning Price Detection(Regression Problem)
 Descriptive analysis of real estate data of France(territoire métropolitain et les DOM-TOM) except Alsace-Moselle and Mayotte.Dataset was splited and arranged based on years.Here with this project we will use data from last 5 years i.e 2015,2016,2017,2018,2019.

This project comprises of data analysis of whole concatenated dataset which can be loaded from mysql server.Also we are solving machine learning price detection.

# Dataset
<img src="https://github.com/Abonia1/Real-Estate-France-DVF/blob/master/Images/DVF_info.jpg" alt="alt text" width="600" height="500">

## Installation
* Python 3.5 
* Scikit-learn (1.20.1)
* Folium
* Numpy
* Seaborn
* pymysql
* Matplotlib
* [Dataset](https://www.data.gouv.fr/en/datasets/demandes-de-valeurs-foncieres/)

## Running
### To install dependencies:
1. First install the required depedencies and run 
`pip install -r requirment.txt`


# Physical data model 
As we designed our database with three table.We created the database DVF and under this we do have three tables:
* dvf_data - Whole dataset with concatenation
* preprocessed_data - Dataset with resample that we will use it with our analysis in ipython
* preprocessed_dashboard_data - Dataset that we will use to built our dashboard in Excel

## MCD-Database Schema ER diagram
<img src="https://github.com/Abonia1/Real-Estate-France-DVF/blob/master/Images/schema_EER.jpg" alt="DVF_schema_EER" >

# 1. Business Problem
## 1.1 Problem Context

For example,our client is a large Real Estate Investment Company,

* Where to invest
* Which is the best land type
* Which type of land type that we need to avoid

## 1.2 Problem Statement
The Client has hired us to find a data-driven approach to valuing properties.

* They currently have an untapped dataset of transaction prices for previous properties on the market.
* The data is collected in 2020.
* Our task is to analyse the data and come to the conclusion to solve the above mentioned problems

## 1.3 Business Objectives and Constraints
* Deliverable: Trained model file
* Win condition: Avg. prediction error 
* Model Interpretability will be useful
* No latency requirement
# 2. Machine Learning Problem
## 2.1 Data Overview

For this project:
 As we do have large dataset and its not possible to un it in a basic machine we will resample the data to built our ML model.

#### Target Variable
* 'Valeur foncière' - Amount of the sale. This amount does not include notary fees and agency fees because it ultimately corresponds to the value of the property sold. This amount is inclusive of VAT.

#### Features of the data:

Property characteristics:
* 'Date mutation' - Date of signing of the deed of sale. it is currently between January 1, 2015 and December 31, 2019 pending the update of new real estate transactions.
* 'Nombre de pièces principales' - Number of main rooms of the property.
* 'Adresse' - The exact address of the property is communicated via several columns such as the street number, postal code etc.
* 'Code Postal' - Postal code of the commune
* 'Code commune' - Commune code
* 'Surface terrain' - Lots and surfaces A co-ownership lot consists of a private part (apartment, cellar, etc.) and a share of the common part (directors' fees). Only the first 5 lots are mentioned. If the number of batches is greater than 5, they are not returned.
* 'Type local' - Type of premises It can be a house, an apartment, an outbuilding (isolated), or an industrial and commercial premises or similar.



## 2.2 Mapping business problem to ML problem
### 2.2.1 Type of Machine Learning Problem
It is a regression problem, where given the above set of features, we need to predict the land price of the house.

### 2.2.2 Performance Metric (KPI)
**Since it is a regression problem, we will use the following regression metrics:**
* Root Mean Squared Error (RMSE)
* R-squared
* Mean Absolute Error

# 3.Feature Engineering

### 3.1.Features Created:

##### One hot Encoding:
* Machine learning algorithms cannot directly handle categorical features. Specifically, they cannot handle text values.
* Therefore, we need to create dummy variables for our categorical features.
* *Dummy variables* are a set of binary (0 or 1) features that each represent a single class from a categorical feature.

### 3.2.Features Removed:
* Features which are mostly empty are removed.

### Data Preparation

As we have already remove duplicates from our data so now we will check for null values and need to manage missing values in data.

    Remove columns which are mostly empty
    Number of rooms is null i.e there is no room so we fill nan with 0
    Our target feature 'Land value' is nan so in order to work with scikit we filter the rows with no nan value for column 'Valeur Fonciere'
    Label missing categorical data

## Compare All Model
<img src="https://github.com/Abonia1/Real-Estate-France-DVF/blob/master/Images/Result.jpg" alt="alt text" width="600" height="500">

## Future Work

1. Dataset preprocessing must be improved further to produce better result.

2. Using only the top best important features with algorithm can improve model performance

3. Use different parameter with different values can also improve the model performance in future



