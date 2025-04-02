# Genotype Frequency Calculation for TTN SNP rs10497520 (STATA Project)

## Overview
This project calculates genotype frequencies for the **rs10497520** SNP in the **TTN gene** using **STATA** and performs a **Hardy-Weinberg Equilibrium (HWE) test**. The results can be used for downstream genetic association studies.

## Files Included
- **stata_genotype_freq.do**: STATA script to compute genotype frequencies and perform HWE testing.
- **dcm_data.csv**: Simulated dataset with genotype information for the rs10497520 SNP.
- **dcm_output.csv**: Output file with calculated frequencies and HWE test results.

## Requirements
- STATA 14 or later
- Basic knowledge of STATA scripting


## Create a simulated dataset, shown in dcm_stata.py

## Import into STATA





## Questions to ask

## 1. What are the frequencies of each genotype : TT, TC, CC

## Answer

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

## 2. Calculate the HWE of the frequencies

p = 0.0036
q = 0.9964
2pq = 

Hardy-Weinberg Chi-Square Test: 123.18279

