# Covid-19_Vaccine_Hesitancy

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
