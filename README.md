# Coursera_R_Getting-and-Cleaning-Data-Course-Project

This repository is created for Getting and Cleaning Data Course Project from Coursera. The input data is collected from the accelerometers from the Samsung Galaxy S smartphone. The input data is hosted on UCI Machine Learning repository.This repo contains two files
1) run_analysis.R: R script for cleaning and preparing tidy dataset
2) tidyDataset.txt: Tidy dataset which is produced as a result of running above R script

The R script run_analysis.R does following: 
1) Download the datasets
2) Load activity labels file
3) Read features file
4) Create a list of features those need to be extracted from the datasets
5) Loan training and test datasets with mean or standard deviation
6) Merge training and test datasets
7) Create a tidy dataset with the average of each variable for each activity and each subject.
8) Write the tidy dataset to a new file called 'tidyDataset.txt'
