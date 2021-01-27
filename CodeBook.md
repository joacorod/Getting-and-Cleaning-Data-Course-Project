
The code starts loading the libraries later used (only dplyr)

First are defined the variables with the paths for the different files that later will be read in the code.

Then are defined the variables Training_set and Test_set, were is stored the tables read from the X_training.txt and X_test.txt
This data frames are merged with rbind and then the file for the feature names is stored in the features variable.

The variable names_dataset is created as an empty vector for later use.

From the variable features is extracted only the features names, and then with a for loop is replaced the names for new descriptive names for the variables.
For this process is used the function paste with the new name for the variable, and then is used the strsplit function to save the funcion and the axis of the variable, 
is also used the funcion as.charecter for using the names as strings and the grepl function for the Boolean instruction of the if statement.

The variables that were renamed before were stored in the names_dataset variable, and then this variable is asignated as names of the dataset of features with the function
names()

Then is created the variable extracted names, that contains the names that only contains the "mean()" and "std" strings, as required in the instructions.

This variable is used for selecting only the columns with the means and standard deviation of the features.

Later are stored the test and training activities in the variables Training_set_activities and Test_set activities.

Both data frames are merged with the function rbind, and is the variable is renamed to "Activity"

Then the different activities are renamed as indicated in the instruction to descriptiive names.

And the data_set is updated, joining the columns with the function cbind() adding the activities to the features dataset.

Finally the subjects are stored in the variables Training_set_subjects and Test_set_subjects, this variables are binded with rbind in the variable subjects, and the column
is renamed to "subeject"

The data_set dataframe is finally merged with the subjects dataframe, obtaining the final tidy dataset as required.

After is created a new tidy dataset named summary_data_set that in first place is grouped by Subjects and Activities with the funcion group_by and then
is each variable is summarised by this groups with the function summarise_all(), obtaining the average for each variable in a tidy data set as required.
