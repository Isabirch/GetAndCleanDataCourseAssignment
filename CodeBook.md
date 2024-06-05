---
title: "CodeBook"
author: "Isabel Birch"
date: "2024-06-03"
output: html_document
---
The file "summarized data.txt" contains the mean and standard deviation for
the following values, separated by both the activity and the subject:

Acceleration data, in gravity units(g):
  BodyAcc
    Separate entries are listed for X, Y, Z, and total magnitude.
    Each value is shown both filtered (t prefix) and transformed (f prefix).
  GravityAcc
    Separate entries are listed for X, Y, Z, and total magnitude.
    Each value is shown only filtered (t prefix).

Angular velocity data, in radians/second:
  BodyGyro
    Separate entries are listed for X, Y, Z, and total magnitude.
    Each value is shown both filtered (t prefix) and transformed (f prefix).

Derived jerk values (g/s and radians/second^2):
  BodyAccJerk
    Separate entries are listed for X, Y, Z, and total magnitude.
    Each value is shown both filtered (t prefix) and transformed (f prefix).
  BodyGyroJerk
    Separate entries are listed for X, Y, Z, and total magnitude.
    BodyGyroJerkMag is shown only transformed (f prefix).