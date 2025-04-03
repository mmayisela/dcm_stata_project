/* STATA Script: Genotype Frequency Calculation for TTN SNP rs10497520 */

clear all
set more off

/* Step 1: Load Data */
import delimited "/Users/minenhle/Desktop/OneDrive_Wits/mini_projects/dcm_genotypte_stata/dcm_data.csv", clear

/* Describe data */
describe

/* Change genotype to factor variable */

encode snp_ttn, generate(snp_gt)

/* Change gender to factor variable */

encode gender, generate(gender_final)

/* View data */
browse


/* Question 1 */

/* Assume data has columns: 'ID', 'SNP'  */
generate homozygous_ref = (snp_gt == "TT")
generate heterozygous = (snp_gt == "TC")
generate homozygous_alt = (snp_gt == "CC")

/* Compute Genotype Frequencies */
tabulate snp_ttn, matcell(freq_matrix)

gen total = _N

gen freq_homozygous_ref = freq_matrix[1,1] / total
gen freq_heterozygous = freq_matrix[2,1] / total
gen freq_homozygous_alt = freq_matrix[3,1] / total

display "Genotype Frequencies for TTN SNP rs10497520"
display "TT: " freq_homozygous_ref
display "TC: " freq_heterozygous
display "CC: " freq_homozygous_alt



/* Question 2 */

/* Hardy-Weinberg Equilibrium Test */
gen p = (2*freq_homozygous_ref + freq_heterozygous) / (2*total)
gen q = 1 - p
gen expected_homo_ref = (p^2) * total
gen expected_hetero = (2*p*q) * total
gen expected_homo_alt = (q^2) * total

/* Perform Chi-Square Test */
gen chi_sq = ((freq_homozygous_ref - expected_homo_ref)^2 / expected_homo_ref) + ((freq_heterozygous - expected_hetero)^2 / expected_hetero) + ((freq_homozygous_alt - expected_homo_alt)^2 / expected_homo_alt)

display "Hardy-Weinberg Chi-Square Test: " chi_sq

/* Step 4: Save Results */
export delimited using "genotype_frequencies_rs10497520.csv", replace



/* Question 3 */

/* summarise age, age is an integer, continous variable (*/

summarise age


/* Question 4 */

/* gender distribution of cohort, categorical variables */

tabulate gender_final


/* Question 5 */ 

/* LVEF average */

summarize LVEF


/* Question 5 */

/* Correlation between age and LVEF */

correlate age lvef

/* Question 6 */ 

/* LVEF significant difference between males and females */

ttest lvef, by(gender_final)

/* Question 7 */

/* Genotype influnce LVEF */

anova lvef snp_gt

/* Question 8 */

/* Does age predict lvef? */

/* You can perform a linear regression to determine whether age significantly predicts LVEF, adjusting for other variables (e.g., gender, genotype).*/

regress lvef age gender_final


/* Question 9 */

/* Does the relationship between genotype and LVEF differ by gender*/

/* You can conduct an interaction analysis to see if the effect of genotype on LVEF varies by gender. */

 regress lvef genotype##gender_final










