/* STATA Script: Genotype Frequency Calculation for TTN SNP rs10497520 */

clear all
set more off

/* Step 1: Load Data */
import delimited "/Users/minenhle/Desktop/OneDrive_Wits/mini_projects/dcm_genotypte_stata/dcm_data.csv", clear

/* Describe data */
describe

/* View data */
browse


/* Question 1 */

/* Assume data has columns: 'ID', 'SNP'  */
generate homozygous_ref = (snp_ttn == "TT")
generate heterozygous = (snp_ttn == "TC")
generate homozygous_alt = (snp_ttn == "CC")

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
