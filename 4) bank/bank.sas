DATA loan_data;
   INPUT AgeGroup $ Late Count;
   DATALINES;
   1 1 53
   1 0 247
   2 1 34
   2 0 266
   ;
RUN;

PROC PRINT DATA=loan_data;
RUN;

/*(b) Computing Sample Proportions of Late Payments:*/
PROC FREQ DATA=loan_data;
   TABLES AgeGroup*Late / NOPERCENT NOROW NOCOL;
   WEIGHT Count;
RUN;

/*(c) Conducting the Two-Proportion Z-Test:*/
PROC FREQ DATA=loan_data;
   TABLES AgeGroup*Late / CHISQ;
   WEIGHT Count;
RUN;

/*(d) Estimate the Difference & 95% Confidence Interval:*/
PROC FREQ DATA=loan_data;
   TABLES AgeGroup*Late / RISKDIFF;
   WEIGHT Count;
RUN;

** FOR ALL THE INTERPRETATION & SUMMARIES, REFER THE DOCUMENT FILE **