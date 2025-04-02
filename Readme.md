# Genotype Frequency Calculation for TTN SNP rs10497520 (STATA Project)

## Overview
This project calculates genotype frequencies for the **rs10497520** SNP in the **TTN gene** using **STATA** and performs a **Hardy-Weinberg Equilibrium (HWE) test**. The results can be used for downstream genetic association studies.

## Files Included
- **stata_genotype_freq.do**: STATA script to compute genotype frequencies and perform HWE testing.
- **genotype_data_rs10497520.csv**: Simulated dataset with genotype information for the rs10497520 SNP.
- **genotype_frequencies_rs10497520.csv**: Output file with calculated frequencies and HWE test results.

## Requirements
- STATA 14 or later
- Basic knowledge of STATA scripting

## How to Run
1. **Load the dataset in STATA:**
   ```stata
   import delimited "genotype_data_rs10497520.csv", clear
