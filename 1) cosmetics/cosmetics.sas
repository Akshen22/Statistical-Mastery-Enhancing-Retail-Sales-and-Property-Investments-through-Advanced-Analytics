/* Run the dataset */

libname mylib 'E:\SHUUsers\55-706554_DataAnalyticsToolsandTechniques\c4057570\HomeSpace\SASTUTS\MYDATA\SAS Assignment 2';

proc print data=mylib.cosmetics;
run;


/*1) 

(i)	Obtain the sample mean and standard deviation of the sales receipts for the trained 
and untrained salespersons and briefly interpret your findings.				
(3 marks)

Answer)*/

proc means data=mylib.cosmetics n mean std;
  var Take1 Take2;
  output out=summary mean=mean_take1 mean_take2 std=std_take1 std_take2;
run;

proc print data=summary;
run;

/*(ii)It is planned to conduct a statistical test to compare the mean sales receipts of the trained and untrained salespersons. 
What distributional assumption must be made in order for the parametric statistical test to be valid? 
Investigate the tenability of this assumption via an appropriate graphical technique (i.e., a data plot or plots).							
(6 marks)

Answer)*/
data differences;
  set mylib.cosmetics;
  diff = Take1 - Take2;
run;

proc univariate data=differences normal;
  var diff;
  histogram / normal;
  qqplot / normal(mu=est sigma=est);
run;

/*(iii) Formulate and conduct a suitable parametric test. If appropriate, give an associated estimate and a corresponding 95% confidence interval. 
Carefully interpret all your findings. (16 marks)

Answer)*/
proc ttest data=mylib.cosmetics;
  paired Take1*Take2;
run;

/*(iv)Formulate and conduct the equivalent non-parametric test to that employed in (iii). 
Critically compare the outcomes of the two tests.(11 marks)

Answer)*/
proc univariate data=mylib.cosmetics;
  var Take1 Take2;
  ods select TestsForLocation; /* Select Wilcoxon Test output */
run;



/*(v) Hence advise the manager regarding the effectiveness of the proposed training course. 
What else would influence the decision on whether to implement the course for all cosmetic salespersons in future years?								
(4 marks)*/

** FOR ALL THE INTERPRETATION & SUMMARIES, REFER THE DOCUMENT FILE **