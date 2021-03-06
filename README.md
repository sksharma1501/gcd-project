gcd-project
===========

Getting and Cleaning Data - Course Project

Here is what the run_alaysis.R does:

i) Defines a helper function to find Mean of all coulmns except the factor columns. This will be used in step viii) below. <br>
ii) Reads Train data files into dataframe. It converts activity codes to descriptive names and labels the coulmn names. <br>
iii) Reads Test data files into dataframe. It converts activity codes to descriptive names  and labels the coulmn names. <br>
iv) Merges the above two dataframes with cbind(). <br>
v) Now reduces the above joint dataframe, by retaining only the mean and standard deviation columns. <br>
vi) Tidies up the variable names by removing braces, changing "-" to "." and changing to lower-case. <br>
vii) Splits the reduced dataframe based on the "subject". <br>
viii) Splits the above frame further based on the "activity". <br>
ix) Applies helper function to find columns means for all sub-lists (multiple lapply). Note that the helper function removes the factor columns viz. "subject" and "activity" before applying colMeans. <br>
x) Writes the data into an intermediate csv file. <br> 
xi) Reads back the csv file and transforms columns to rows in the new dataframe. Writes the new tidy data into another .csv file, which is a text file and easily readable in spreadsheet software. <br><br>
<b> Note: </b> For Coursera uploading purpose, .txt extension has been added to the output .csv file. Though it can be opened in any text editor, it would be easier to read in spreadsheet software like Excel (first remove the .txt extension). <br>
