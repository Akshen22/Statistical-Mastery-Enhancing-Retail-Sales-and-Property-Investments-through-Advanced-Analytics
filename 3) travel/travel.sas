/* Run the dataset */

libname mylib 'E:\SHUUSERS\55-706554_DataAnalyticsToolsandTechniques\c4057570\HomeSpace\sastuts\mydata\SAS Assignment 2';

proc print data=mylib.travel;
run;


/*(i) Fit the bivariate regression model of Claim on Age. Obtain:
? a scatterplot of Claim against Age with the fitted regression line superimposed
? a plot of studentised residuals against fitted values
Critically discuss these two plots and draw appropriate conclusions regarding the adequacy
of the systematic component of the fitted model.
(13 marks)

Answers:)
(a) Fitting the Bivariate Regression Model (Claim on Age)*/
proc reg data=mylib.travel;
    model Claim = Age/clb;
    OUTPUT OUT=reg_results P=Predicted R=Residuals STUDENT=Studentized_Residuals;
run;
quit;
/* CLB requests confidence limits for coefficients 

(b)Scatterplot of Claim vs. Age with Fitted Regression Line:*/
PROC SGPLOT DATA=mylib.travel;
    SCATTER X=Age Y=Claim / MARKERATTRS=(SYMBOL=CIRCLEFILLED COLOR=BLUE);
    REG X=Age Y=Claim / LINEATTRS=(COLOR=RED THICKNESS=2);
    TITLE "Scatterplot of Claim vs. Age with Fitted Regression Line";
    XAXIS LABEL="Age";
    YAXIS LABEL="Mean Claim (£)";
RUN;
/*(c) Plot of Studentized Residuals vs. Fitted Values:*/
PROC SGPLOT DATA=reg_results;
    SCATTER X=Predicted Y=Studentized_Residuals / MARKERATTRS=(SYMBOL=CIRCLEFILLED COLOR=BLUE);
    REFLINE 0 / AXIS=Y LINEATTRS=(COLOR=RED PATTERN=DASH);
    TITLE "Studentized Residuals vs. Fitted Values";
    XAXIS LABEL="Fitted Values";
    YAXIS LABEL="Studentized Residuals";
RUN;

/*(ii) Now fit the bivariate regression model of LnClaim on Age. Obtain:
• A scatterplot of LnClaim against Age with the fitted regression line superimposed
• A plot of studentised residuals from this regression against the corresponding fitted
values
• A histogram of the studentised residuals
• A normal probability plot of the studentised residuals
Carefully explaining your methodology, investigate the adequacy of the new fitted
regression model. Which model would you recommend for these data and why?
(12 marks)

Answers:)
(a) Fit the Regression Model: LnClaim ~ Age */
PROC REG DATA=mylib.travel;
    MODEL LnClaim = Age / r;
    OUTPUT OUT=RegOut 
        PREDICTED=PredLnClaim 
        RESIDUAL=ResidLnClaim 
        STUDENT=StudResid;
RUN;
QUIT;

/*(b) Scatterplot of LnClaim vs Age with regression line */
PROC SGPLOT DATA=RegOut;
    SCATTER X=Age Y=LnClaim / MARKERATTRS=(COLOR=BLUE);
    REG X=Age Y=LnClaim / LINEATTRS=(COLOR=RED THICKNESS=2);
    TITLE "Scatterplot of LnClaim vs. Age with Fitted Regression Line";
RUN;

/*(c)Plot of Studentized Residuals vs. Fitted Values */
PROC SGPLOT DATA=RegOut;
    SCATTER X=PredLnClaim Y=StudResid / MARKERATTRS=(COLOR=BLUE);
    REFLINE 0 / AXIS=Y LINEATTRS=(COLOR=RED PATTERN=DASH);
    TITLE "Studentized Residuals vs. Fitted Values";
RUN;

/*(d) Histogram of Studentized Residuals */
PROC UNIVARIATE DATA=RegOut;
    VAR StudResid;
    HISTOGRAM StudResid / NORMAL;
    TITLE "Histogram of Studentized Residuals";
RUN;

/*(e) Normal Probability Plot (Q-Q Plot) */
PROC UNIVARIATE DATA=RegOut NORMAL PLOT;
    QQPLOT StudResid / NORMAL(MU=EST SIGMA=EST);
    TITLE "Normal Probability Plot of Studentized Residuals";
RUN;

/*(iii) Write down the fitted model obtained in (ii) above, commenting briefly on the value of the
estimated slope. Explain how the model can be used to estimate the mean value of a travel
insurance claim for an over-50's claimant from his/her age.
Obtain and print out the estimated mean values of LnClaim for each observation on the data
set, together with corresponing 95% confidence limits. Use this model to estimate the mean
value claimed for a 70-year old claimant. Give and interpret an associated 95% confidence
interval.
What other information about travel insurance claims by over-50's should the company also
investigate in order to be able to complete its claim costings?
(10 marks)

Answer:)
(c) Obtain Estimated Mean Values of LnClaim for Each Observation with 95% Confidence Limits:
We now compute:
- Predicted values of LnClaim
- 95% Confidence Limits for each prediction 

/* Compute Predicted Values and 95% Confidence Intervals */
PROC REG DATA=mylib.travel;
    MODEL LnClaim = Age;
    OUTPUT OUT=pred_results P=Predicted_LnClaim LCLM=Lower95 UCLM=Upper95;
RUN;

/* Print the results */
PROC PRINT DATA=pred_results;
    VAR Age Predicted_LnClaim Lower95 Upper95;
    TITLE "Estimated Mean Values of LnClaim with 95% Confidence Limits";
RUN;

/*(d)Add a New Observation for Age = 70 */
DATA new_data;
    INPUT Age;
    DATALINES;
    70
;
RUN;

/* Append New Observation to the Existing Dataset */
DATA combined_data;
    SET mylib.travel new_data;
RUN;

/* Run Regression Model and Predict Claims */
PROC REG DATA=combined_data;
    MODEL LnClaim = Age;
    OUTPUT OUT=pred_results P=Predicted_LnClaim LCLM=Lower95 UCLM=Upper95;
RUN;

/* Extract and Display Prediction for Age = 70 */
PROC PRINT DATA=pred_results;
    WHERE Age = 70;
    VAR Age Predicted_LnClaim Lower95 Upper95;
    TITLE "Prediction for a 70-Year-Old Claimant with 95% Confidence Interval";
RUN;

** FOR ALL THE INTERPRETATION & SUMMARIES, REFER THE DOCUMENT FILE **
