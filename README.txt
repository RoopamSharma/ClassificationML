Start with main file in ATNT50 folder.
Main take one input string.
-‘all’ runs all classifiers
-‘knn’ for knn classifier
-‘cent’ for centroid classifier
-‘linear’ for linear classifier
-‘svm’ for svm classifier
Inside main function we are loading the dataset in data1 variable.
KNN, Centroid, Linear Classifiers have been implemented explicitly by me. For SVM I have used LIBSVM library.
Program output the accuracy for each classifier for each Cross Validation.
SVM gives the list of estimated values and accuracy in the end.
For (C) part function partitionData(data,v) will partition the data into training and testing sets. 
Data represents the dataset.
‘v’ represents the fraction of training data with respect to test data. In my case I have used 0.8.

