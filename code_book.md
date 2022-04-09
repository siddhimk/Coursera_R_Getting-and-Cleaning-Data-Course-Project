This repo contains following files: 

1) run_analysis.R: R script for cleaning and preparing tidy dataset
2) tidyDataset.txt: Tidy dataset which is produced as a result of running above R script


Details of run_analysis.R script:  

Following are the steps used for processing the input data and create new tidy dataset. 

1. Download input data: 
The data used for this project is from the UCI Machine Learning Repository. The data was collected from the accelerometers from the Samsung Galaxy S smartphone. The first step is to download and unzip the data. 

2. Load activity labels: 
The activity labels data is for different activity code and label for activities such as walking, walking upstairs, walking downstairs, sitting, standing and laying

3. Load features:
The features data is the collection of 561 features 

4. Next step is to extract the features related to mean and standard deviation

5. Load training sets:
70% of the overall data is selected as training data. The X_train dataset contains the features values and y_train dataset contains the corresponding activity label. There are 7,352 observations in training dataset. 

6. Load test sets:
30% of the overall data is selected as test data. The X_test dataset contains the features values and y_test dataset contains the corresponding activity label. The test data contains 2,947 records. 

7. Merge training and test datasets.

8. Create new tidy dataset with the average of each variable for each activity and each subject.

9. Write new tidy daset to a file named 'tidyDataset.txt'.
