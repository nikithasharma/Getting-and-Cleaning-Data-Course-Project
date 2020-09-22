# Code Book

The attached R script (run_analysis.R) performs the following to clean up the data:  
he result is a 10299x66 data frame, because only 66 out of 561 attributes are measurements on the mean and standard deviation. All measurements appear to be floating point numbers in the range (-1, 1).  

* Descriptive activity names to name the activities in the data set:  

        walking  
        
        walkingupstairs  
        
        walkingdownstairs  
        
        sitting  
        
        standing  
        
        laying  

* The script also appropriately labels the data set with descriptive names: all feature names (attributes) and activity names are converted to lower case, underscores and brackets ().The names of the attributes are similar to the following:  

        tbodyacc-mean-x   
        
        tbodyacc-mean-y   
        
        tbodyacc-mean-z   
        
        tbodyacc-std-x  
        
        tbodyacc-std-y  
        
        tbodyacc-std-z  
        
        tgravityacc-mean-x  
        
        tgravityacc-mean-y  
