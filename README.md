# Covid-19_Vaccine_Hesitancy

## Project Overview

### Draft presentation link: 
[Project_Presentation-Draft_Version](https://docs.google.com/presentation/d/10iqx7s8fsEXmWn9LjPyQ8yCpLilgcIdqZBfQSx1DNV8/edit?usp=sharing)

### Background
This topic was chosen due to a shared interest in healthcare and public health as it relates to Covid-19.
<br>
(This section is not completed).

### Purpose
The purpose of this project is to explore which factors are more likely to contribute to an individual’s hesitancy of getting (or not getting) the Covid-19 vaccine. By analyzing Covid-19, US Census, and demographic data, we hope to determine:
<br>
- Which demographic factors, such as income and proverty level, employment status, race/ethnicity, and access to transportation are more likely to contribute to vaccine hesitancy?
- Can we assume that counties that voted for Donald Trump are more likely to have higher populations of individuals who are vaccine hesitant?

### Resources
- Data sources: [US Census Demographic Data](https://www.kaggle.com/muonneutrino/us-census-demographic-data?select=acs2017_county_data.csv); [Vaccine Hesitancy for COVID-19](https://data.cdc.gov/Vaccinations/Vaccine-Hesitancy-for-COVID-19-County-and-local-es/q9mh-h2tw); [Election, COVID, and Demographic Data by County](https://www.kaggle.com/etsc9287/2020-general-election-polls); [Urban-Rural Classification for Counties](https://www.cdc.gov/nchs/data_access/urban_rural.htm#Data_Files_and_Documentation)
- Software: Jupyter Notebook; QuickDBD; pgAdmin 4; Tableau Public; Amazon Web Services

### Results
- Poverty is the most important feature, followed by percentage of votes for Joe Biden in 2020 election.
- The third most important feature is percent of african american population in the county.
- There is moderate negative correlation between percentage of votes for Joe Biden (2020) and percentage of white population in a county.
- There is weak negative correlation between percentage of votes for Donald Trump (2020) and percentage of asian population as well as percentage of african american population in a county.
- There is significant difference at 95% CL for low and moderate hesitancy.

### Summary
<b>Which demographic factors, such as income and poverty level, employment status, race/ethnicity, and access to transportation are more likely to contribute to vaccine hesitancy?</b>
- Poverty (economy)
- Percentage of votes for Joe Biden in 2020 election (political views)
- Percent of african american population in the county (race)

<b>Can we assume that counties that voted for Donald Trump are more likely to have higher populations of individuals who are vaccine hesitant?</b>
- Yes. Our analysis showed that counties that Trump carried in the 2020 Presidential election were more likely to have moderate hesitancy between 15% and 25% (76% counties vs. 46% counties) and less likely to have low hesitancy below 15% (11% of counties vs. 42% of counties)

## Machine Learning Model

### Description of preliminary data preprocessing
During preprocessing, four databases were joined to create the a file to be used in the machine learning model. Next, the file was converted to a dataframe. Null rows and columns, and duplicate rows were then removed from the dataframe. Using numpy, estimated hesitancy data was converted from integers to string, creating a new “hesitancy” column. Data was split into “low hesitancy,” “moderate hesitancy,” and “high hesitancy.” This final data was saved as a CSV file and used for the machine learning model.

### Description of preliminary feature engineering and preliminary feature selection, including their decision-making process
Variables were chosen as follow:
<br>
<br>
<b>Independent variables</b>
<br>
X = county_data_df[["percent_white","percent_hispanic", "percent_american_indian_alaska_native",
                        "percent_asian", "percent_black", "percent_hawaiian_pacific", "Poverty", 
                        "ChildPoverty", "Drive","Carpool", "Transit", "Walk", "OtherTransp",
                        "WorkAtHome", "PrivateWork", "PublicWork", "SelfEmployed", "FamilyWork", "Unemployment", 
                        "percentage20_Donald_Trump", "percentage20_Joe_Biden", "population_scaled"]]

<b>Dependent Variable</b>
<br>
y = county_data_df['hesitancy']

### Description of how data was split into training and testing sets
The data was split into training and testing sets using the random state parameter to guarantee that the same sequence of random numbers is generated each time we run the code.

### Explanation of model choice, including limitations and benefits
After exploring various logistic regression models, such as muliple logistic regression, naïve random sampling, SMOTE oversampling, undersampling, and random forest classifier, the group chose to use the multiple logistic regression model, as it yielded an 77% accuracy, precision, and recall.
<br>
<b>Advantages</b>
- Best for categorical data
- Easier to train and interpret
- Provides good accuracy

<b>Disadvantages</b>
<br>
- Can be prone to overfitting if the number of observations is lesser than the number of features
- Cannot be used for non-linear data
- Not good for complex relationships

### Model Performance
- The model performed well while predicting medium hesitancy, as expected.
- The model only predicted 1 datapoint as high hesitancy when it was truly low hesitancy.
- The model only predicted 2 datapoints as low hesitancy when it was truly high hesitancy.
