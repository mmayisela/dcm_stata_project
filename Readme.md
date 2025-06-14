# Genotype Frequency Calculation for TTN SNP rs10497520 (STATA Project)

## Overview
This project calculates genotype frequencies for the **rs10497520** SNP in the **TTN gene** using **STATA** and performs a **Hardy-Weinberg Equilibrium (HWE) test**. The results can be used for downstream genetic association studies.

## Files Included
- **dcm_stata.py**: script to simulate dcm_data.csv 
- **stata_genotype_freq.do**: STATA script to compute genotype frequencies and perform HWE testing.
- **dcm_data.csv**: Simulated dataset with genotype information for the rs10497520 SNP.


## Requirements
- STATA 14 or later
- Basic knowledge of STATA scripting


## Create a simulated dataset, shown in dcm_stata.py

## Import into STATA





## Questions to ask

## 1. What are the frequencies of each genotype : TT, TC, CC

## Answer

```markdown

 SNP_TTN |      Freq.     Percent        Cum.
------------+-----------------------------------
         CC |         18       18.00       18.00
         TC |         36       36.00       54.00
         TT |         46       46.00      100.00
------------+-----------------------------------
      Total |        100      100.00



Genotype Frequencies for TTN SNP rs10497520

TT: .18000001

TC: .36000001

CC: .46000001

```

## 2. Calculate the HWE of the frequencies

```markdown

p = 0.0036
q = 0.9964
2pq = 

Hardy-Weinberg Chi-Square Test: 123.18279

For chi2 that is greater than 3.84, we reject hypothesis that observed and expected are equivalent. Population not in HW equilibrium

```


## 3. What is the distribution of age in the entire cohort

```markdown
Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
         age |        100       49.68    14.39548         18         80

```

Standard deviation measures the spread or variability of data points around the mean

## 4. What is the gender distribution of this cohort

```markdown

 Gender |      Freq.     Percent        Cum.
------------+-----------------------------------
     Female |         49       49.00       49.00
       Male |         51       51.00      100.00
------------+-----------------------------------
      Total |        100      100.00

```



## 5. What is the correlation between LVEF and Age
```markdown

      |      age     lvef
-------------+------------------
         age |   1.0000
        lvef |   0.0227   1.0000

```
0.0227 correlation means there is not much correlation

## 6. Is there a significant difference between LVEF in males and females

```markdown

Two-sample t test with equal variances
------------------------------------------------------------------------------
   Group |     Obs        Mean    Std. err.   Std. dev.   [95% conf. interval]
---------+--------------------------------------------------------------------
  Female |      49    47.31837    1.370224    9.591569    44.56335    50.07339
    Male |      51    44.73725    1.268579     9.05947    42.18924    47.28527
---------+--------------------------------------------------------------------
Combined |     100      46.002    .9366877    9.366877    44.14341    47.86059
---------+--------------------------------------------------------------------
    diff |            2.581113     1.86515               -1.120217    6.282442
------------------------------------------------------------------------------
    diff = mean(Female) - mean(Male)                              t =   1.3839
H0: diff = 0                                     Degrees of freedom =       98

    Ha: diff < 0                 Ha: diff != 0                 Ha: diff > 0
 Pr(T < t) = 0.9152         Pr(|T| > |t|) = 0.1695          Pr(T > t) = 0.0848


```

All the probabilities are greater than 0.05 therefore we fail to reject the null hypothesis 

## 7. Does genotype for specific influence LVEF

```markdown

Number of obs =        100    R-squared     =  0.0076
                         Root MSE      =    9.42708    Adj R-squared = -0.0129

                  Source | Partial SS         df         MS        F    Prob>F
              -----------+----------------------------------------------------
                   Model |  65.728414          2   32.864207      0.37  0.6918
                         |
                  snp_gt |  65.728414          2   32.864207      0.37  0.6918
                         |
                Residual |  8620.3714         97   88.869808  
              -----------+----------------------------------------------------
                   Total |  8686.0998         99   87.738382  

. 

```
p = 0.6918 meaning we fail to reject null hypothesis that genotype does not infuence lvef

## 8. Is age a significant predictor of LVEF

```markdown

Source |       SS           df       MS      Number of obs   =       100
-------------+----------------------------------   F(2, 97)        =      0.96
       Model |  167.985788         2  83.9928939   Prob > F        =    0.3878
    Residual |  8518.11399        97  87.8156081   R-squared       =    0.0193
-------------+----------------------------------   Adj R-squared   =   -0.0009
       Total |  8686.09978        99  87.7383816   Root MSE        =     9.371

------------------------------------------------------------------------------
        lvef | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
-------------+----------------------------------------------------------------
         age |   .0085681   .0655828     0.13   0.896    -.1215956    .1387318
gender_final |  -2.564079   1.879103    -1.36   0.176    -6.293579     1.16542
       _cons |    49.4481   4.563736    10.84   0.000     40.39034    58.50585
------------------------------------------------------------------------------

```
F(2, 97) = 0.96, p = 0.3878 → Since p > 0.05, the model is not statistically significant, indicating that age and gender_final do not explain lvef well.

## 9. Does the relationship between genotype and LVEF differ by gender?

```markdown


      Source |       SS           df       MS      Number of obs   =       100
-------------+----------------------------------   F(5, 94)        =      1.69
       Model |  716.100575         5  143.220115   Prob > F        =    0.1448
    Residual |   7969.9992        94  84.7872256   R-squared       =    0.0824
-------------+----------------------------------   Adj R-squared   =    0.0336
       Total |  8686.09978        99  87.7383816   Root MSE        =     9.208

-------------------------------------------------------------------------------------
               lvef | Coefficient  Std. err.      t    P>|t|     [95% conf. interval]
--------------------+----------------------------------------------------------------
             snp_gt |
                TC  |   5.201764   3.669633     1.42   0.160    -2.084378    12.48791
                TT  |   1.344545   3.511793     0.38   0.703    -5.628201    8.317292
                    |
       gender_final |
              Male  |   5.577499   4.367737     1.28   0.205    -3.094745    14.24974
                    |
snp_gt#gender_final |
           TC#Male  |  -12.79453   5.341076    -2.40   0.019    -23.39936   -2.189695
           TT#Male  |  -7.552878   5.144307    -1.47   0.145    -17.76702    2.661263
                    |
              _cons |      44.91   2.911825    15.42   0.000      39.1285     50.6915
-------------------------------------------------------------------------------------

```

F(5, 94) = 1.69, p = 0.1448 → Since p > 0.05, the overall model is not statistically significant. This suggests the predictors do not strongly explain variation in lvef.

## 10.  Is there an association between age and genotype frequency (e.g., age distribution across genotypes)?

```markdown


           |                                           Age
   SNP_TTN |        18         19         20         21         25         27         28         31 |     Total
-----------+----------------------------------------------------------------------------------------+----------
        CC |         0          0          0          1          0          0          1          1 |        18 
        TC |         1          0          0          0          1          0          0          2 |        36 
        TT |         0          1          1          0          0          1          1          1 |        46 
-----------+----------------------------------------------------------------------------------------+----------
     Total |         1          1          1          1          1          1          2          4 |       100 


           |                                           Age
   SNP_TTN |        33         34         35         36         37         38         39         40 |     Total
-----------+----------------------------------------------------------------------------------------+----------
        CC |         0          0          0          0          0          0          1          1 |        18 
        TC |         0          0          0          0          1          1          1          2 |        36 
        TT |         1          1          1          1          0          1          2          2 |        46 
-----------+----------------------------------------------------------------------------------------+----------
     Total |         1          1          1          1          1          2          4          5 |       100 


           |                                           Age
   SNP_TTN |        41         42         43         44         45         46         47         48 |     Total
-----------+----------------------------------------------------------------------------------------+----------
        CC |         0          0          0          0          0          1          0          0 |        18 
        TC |         2          1          1          1          0          4          0          1 |        36 
        TT |         1          4          0          1          1          0          1          0 |        46 
-----------+----------------------------------------------------------------------------------------+----------
     Total |         3          5          1          2          1          5          1          1 |       100 


           |                                           Age
   SNP_TTN |        49         50         51         52         53         54         55         56 |     Total
-----------+----------------------------------------------------------------------------------------+----------
        CC |         0          1          1          1          0          0          1          1 |        18 
        TC |         1          1          1          0          1          1          0          0 |        36 
        TT |         1          1          3          1          0          1          0          2 |        46 
-----------+----------------------------------------------------------------------------------------+----------
     Total |         2          3          5          2          1          2          1          3 |       100 


           |                                           Age
   SNP_TTN |        57         58         59         60         61         62         63         65 |     Total
-----------+----------------------------------------------------------------------------------------+----------
        CC |         0          1          1          0          2          0          0          0 |        18 
        TC |         1          1          1          1          1          1          0          1 |        36 
        TT |         0          0          2          1          0          5          2          0 |        46 
-----------+----------------------------------------------------------------------------------------+----------
     Total |         1          2          4          2          3          6          2          1 |       100 


           |                                           Age
   SNP_TTN |        66         67         69         71         73         74         76         80 |     Total
-----------+----------------------------------------------------------------------------------------+----------
        CC |         1          0          0          0          0          1          1          0 |        18 
        TC |         1          0          1          0          0          0          0          3 |        36 
        TT |         0          1          1          1          1          0          0          1 |        46 
-----------+----------------------------------------------------------------------------------------+----------
     Total |         2          1          2          1          1          1          1          4 |       100 

         Pearson chi2(94) =  84.5149   Pr = 0.748

```










