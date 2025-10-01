/* Run the dataset */

libname mylib 'E:\SHUUsers\55-706554_DataAnalyticsToolsandTechniques\c4057570\HomeSpace\SASTUTS\MYDATA\SAS Assignment 2';

proc print data=mylib.pubvalues;
run;


/*(i) Fully investigate and discuss any issues of multicollinearity between the ten potential
explanatory variables listed above.
(15 marks)

Answer:)
(a) Checking Correlation Among Variables*/
PROC CORR DATA=mylib.pubvalues pearson; /* Check correlation among variables */
    VAR Ratevalue Footprint Otherarea House Pubs Food Social Employ Car Garden;
RUN;

/*(b) Compute Variance Inflation Factor (VIF)*/
proc reg data=mylib.pubvalues;
    model Ratevalue = Footprint Otherarea House Pubs Food Social Employ Car Garden / vif;
run;
/*(c) Compute Tolerance:*/
proc reg data=mylib.pubvalues;
   model Ratevalue = Footprint Otherarea House Pubs Food Social Employ Car Garden/TOL;
run;
/*(d) Compute Condition Index (CI):*/
proc reg data=mylib.pubvalues;
   model Ratevalue = Footprint Otherarea House Pubs Food Social Employ Car Garden/COLLINOINT;
run;
/*(e) Remedy Multicollinearity:*/
PROC REG DATA=mylib.pubvalues;
    MODEL Ratevalue = Pubs Food Social Employ Car/ SELECTION=STEPWISE;
RUN;

/*(ii) Fit appropriate multiple regression models to these data using both forward selection and
backward elimination procedures, in each case using an associated significance level of 5%. For
each procedure, state and briefly justify the decision taken at each step, and identify the
explanatory variables present in the final reduced model.
Briefly discuss the composition of the final models obtained with these two different
approaches in the light of the collinearity analysis conducted in part (i).
(15 marks)

Answer:)
(a) Forward Selection:*/
PROC REG DATA=mylib.pubvalues;
    MODEL Ratevalue = Pubs Food Social Employ Car 
    / SELECTION=FORWARD SLENTRY=0.05;
RUN;

/*(b) Backward Elimination:*/
PROC REG DATA=mylib.pubvalues;
    MODEL Ratevalue = Pubs Food Social Employ Car 
    / SELECTION=BACKWARD SLSTAY=0.05;
RUN;

/*(c) Checkig Multicollinearity using VIF:*/
PROC REG DATA=mylib.pubvalues;
    MODEL Ratevalue = Pubs Employ / VIF;
RUN;

/*(iii) Further investigate model selection using the Cp method for comparing all possible models.
Comment specifically on the two reduced models identified in (ii) above.
Hence, using the data alone, choose a final, reduced model, justifying your choice. Are any other
models of the selected size also reasonable candidates for selection? Explain.
(10 marks)

Answer:)
(a)*/
PROC REG DATA=mylib.pubvalues;
    MODEL Ratevalue = Pubs Food Social Employ Car / SELECTION=CP BEST=5;
RUN;


/*(iv) Consider again the reduced model obtained by backward elimination. State the fitted regression
equation for this model. Interpret and briefly discuss each of the partial regression coefficients
and the relevant related information in the output by SAS.
(13 marks)

Answer:)
(a) Reduced model obtained from Backward Elimination:*/
PROC REG DATA=mylib.pubvalues;
    MODEL Ratevalue = Pubs Food Social Employ Car / SELECTION=BACKWARD SLSTAY=0.05;
RUN;

/*(g) Model Validation:*/
PROC REG DATA=mylib.pubvalues;
    MODEL Ratevalue = Pubs Employ / VIF;
RUN;


/*(v)Investigate the overall validity of the reduced model obtained by backward elimination by
undertaking suitable diagnostic analyses involving the studentised and/or deleted residuals
and/or the fitted values. Note that you are not required to produce plots involving residuals and
the surviving explanatory variables.
(10 marks)

Answer:)
Regression with diagnostics*/
PROC REG DATA=mylib.pubvalues;
    MODEL Ratevalue = Pubs Employ / R INFLUENCE;
    OUTPUT OUT=diagnostics 
           PREDICTED=Pred 
           RSTUDENT=Rstudent 
           COOKD=CookD;
RUN;

/*Summarize residuals for normality and variance check*/
PROC UNIVARIATE DATA=diagnostics;
    VAR Rstudent;
    HISTOGRAM Rstudent / NORMAL; /* Optional histogram for visual check, but not required */
RUN;

DATA mylib.pubvalues_no_outlier;
    SET mylib.pubvalues;
    IF _N_ NE 1; /* Exclude Observation 1 */
RUN;

PROC REG DATA=mylib.pubvalues_no_outlier;
    MODEL Ratevalue = Pubs Employ / R INFLUENCE;
RUN;

/*(vi) Considering again the reduced model obtained by backward elimination, identify any potential
influential observations (use the value of the variable ID to specify each such observation).
Further investigate the two most extreme of these potential influential observations with respect
to their effect on the model by considering the corresponding values of the leverage H, the
deleted residual, the covariance ratio C and their DFBETAS values. Note that you are not required
to construct a plot of observed versus fitted values for these observations.
(14 marks)

Answer:)
/*(a) Regression with diagnostics for the reduced model */
PROC REG DATA=mylib.pubvalues;
    MODEL Ratevalue = Pubs Employ / R INFLUENCE;
    OUTPUT OUT=diagnostics 
           PREDICTED=Pred 
           RSTUDENT=Rstudent 
           COOKD=CookD 
           H=H 
           COVRATIO=CovRatio 
           DFFITS=Dffits 
           DFB

/*(vii) Based on a comprehensive business analysis, the company will fully investigate a property as a
potential purchase if it can reasonably be anticipated that the total income for one year (52
weeks) would be greater than or equal to the property's (freehold) price.
"The Good King James" has just come onto the market with an advertised freehold price of
£515,000. Its rateable value is £13,000, local unemployment is running at 10% and the property
has an accessible outside space of 100 m2.
Given that the company has satisfactorily investigated the various influential points identified in
(vi) and found all the data to be completely valid, use the reduced model obtained by backward
elimination to advise the company as to whether it should further investigate "The Good King
James", commenting on the reliability of your analysis.
What is the maximum price that the company should consider offering (assuming the necessary
further investigations are satisfactory) if it wishes to have 95% assurance that its potential
investment in the property is well founded?
(8 marks)

Answer:)*/
DATA predict_property;
    INPUT Pubs Employ;
    DATALINES;
    1 90
    ;
RUN;

PROC REG DATA=mylib.pubvalues;
    MODEL Ratevalue = Pubs Employ;
    OUTPUT OUT=prediction PREDICTED=Pred LCL=LCL95 UCL=UCL95;
    DATA predict_property;
        SET predict_property;
        OUTPUT;
    RUN;
QUIT;

PROC PRINT DATA=prediction;
RUN;

** FOR ALL THE INTERPRETATION & SUMMARIES, REFER THE DOCUMENT FILE **