gcd-project
===========

Getting and Cleaning Data - Course Project

Here is what the run_alaysis.R does:

i) Sets the working directory to the location of data files (path should be same as where the data files are unzipped)
ii) Reads Train data files into dataframe and labels the coulmn names
iii) Read Test data files into dataframe and labels the coulmn names
iv) Merges the above two dataframes with cbind()
v) Now reduces the above joint dataframe, by retaining only the mean and standard deviation columns
vi) Splits the reduced dataframe based on the subject id.
vii) Splits the above frame further based on the activity.
viii) Applies helper function to find columns means for all sub-lists (multiple lapply). Note that the helper function removes the factor columns viz. "subject" and "activity" before applying colMeans.
ix) Writes the tidy data into csv file, which is a text file and easily readable in spreadsheet software.
x) Note: For uploading purpose, .txt extension has been added to .csv file. Though it can be opened in any text editor, it would be easier to read in spreadsheet software like Excel (first remove the .txt extension).
