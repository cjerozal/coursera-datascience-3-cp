## The Data File

The final tidy data is contained in the `tidydata.txt` file produced by running the `run_analysis.R` script (with the unzipped original dataset in the same directory). See `README.md` for details on the original dataset and its processing.
It can be read with the following R code:

```readTidyData <- read.table("tidydata.txt")```

## Variables in Data

Each row contains 68 columns, which are described below.

* Subject.ID - integer ID from 1-30 indicating which of the thirty subjects the
data applies to
* Activity - strings (factor when read in) desribing the kind of activity which 
the subjects were performing at the time of the measurements

The remaining 66 variables are averages of the measurements from the original 
data set that correspond to a particular subject and activity. The names
correspond to the measurement names in the original data set, with some expanded
abbreviations for clarity. As in the original data set, the X, Y, and Z at the
end of variable names stand for axial signals in the X, Y, and Z directions.
These are all numeric measurements:
* timeBodyAcc.mean.X
* timeBodyAcc.mean.Y
* timeBodyAcc.mean.Z
* timeBodyAcc.std.X
* timeBodyAcc.std.Y
* timeBodyAcc.std.Z
* timeGravityAcc.mean.X
* timeGravityAcc.mean.Y
* timeGravityAcc.mean.Z
* timeGravityAcc.std.X
* timeGravityAcc.std.Y
* timeGravityAcc.std.Z
* timeBodyAccJerk.mean.X
* timeBodyAccJerk.mean.Y
* timeBodyAccJerk.mean.Z
* timeBodyAccJerk.std.X
* timeBodyAccJerk.std.Y
* timeBodyAccJerk.std.Z
* timeBodyGyro.mean.X
* timeBodyGyro.mean.Y
* timeBodyGyro.mean.Z
* timeBodyGyro.std.X
* timeBodyGyro.std.Y
* timeBodyGyro.std.Z
* timeBodyGyroJerk.mean.X
* timeBodyGyroJerk.mean.Y
* timeBodyGyroJerk.mean.Z
* timeBodyGyroJerk.std.X
* timeBodyGyroJerk.std.Y
* timeBodyGyroJerk.std.Z
* timeBodyAccMag.mean
* timeBodyAccMag.std
* timeGravityAccMag.mean
* timeGravityAccMag.std
* timeBodyAccJerkMag.mean
* timeBodyAccJerkMag.std
* timeBodyGyroMag.mean
* timeBodyGyroMag.std
* timeBodyGyroJerkMag.mean
* timeBodyGyroJerkMag.std
* freqBodyAcc.mean.X
* freqBodyAcc.mean.Y
* freqBodyAcc.mean.Z
* freqBodyAcc.std.X
* freqBodyAcc.std.Y
* freqBodyAcc.std.Z
* freqBodyAccJerk.mean.X
* freqBodyAccJerk.mean.Y
* freqBodyAccJerk.mean.Z
* freqBodyAccJerk.std.X
* freqBodyAccJerk.std.Y
* freqBodyAccJerk.std.Z
* freqBodyGyro.mean.X
* freqBodyGyro.mean.Y
* freqBodyGyro.mean.Z
* freqBodyGyro.std.X
* freqBodyGyro.std.Y
* freqBodyGyro.std.Z
* freqBodyAccMag.mean
* freqBodyAccMag.std
* freqBodyAccJerkMag.mean
* freqBodyAccJerkMag.std
* freqBodyGyroMag.mean
* freqBodyGyroMag.std
* freqBodyGyroJerkMag.mean
* freqBodyGyroJerkMag.std
