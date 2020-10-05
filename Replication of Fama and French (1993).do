/*
######################################################
Replication of some tables in Fama and French (1993) #
by XIE Lin                                           #
######################################################
*/

// Replication of Table 2

sum rmrf smb hml if date >= 196307 & date <= 199112

foreach x in rmrf smb hml {
ttest `x' = 0 if date >= 196307 & date <= 199112
}

tsset time

foreach x in rmrf smb hml {
reg `x' l. `x' l2. `x' l12. `x' if date >= 196307 & date <= 199112
}

corr rmrf smb hml if date >= 196307 & date <= 199112

/* generate new variables
foreach x in me1bm1 me2bm1 me3bm1 me4bm1 me5bm1 me1bm2 me2bm2 me3bm2 /*
		*/me4bm2 me5bm2 me1bm3 me2bm3 me3bm3 me4bm3 me5bm3 me1bm4 me2bm4 /*
		*/me3bm4 me4bm4 me5bm4 me1bm5 me2bm5 me3bm5 me4bm5 me5bm5{
gen er`x' = `x' - rf
}
*/

sum erme1bm1 - erme5bm5 if date>=196307 & date<=199112

foreach x in me1bm1 me2bm1 me3bm1 me4bm1 me5bm1 me1bm2 me2bm2 me3bm2 /*
		*/me4bm2 me5bm2 me1bm3 me2bm3 me3bm3 me4bm3 me5bm3 me1bm4 me2bm4 /*
		*/me3bm4 me4bm4 me5bm4 me1bm5 me2bm5 me3bm5 me4bm5 me5bm5{
ttest er`x'=0 if date>=196307 & date<=199112
}

// Replication of Table 4

foreach x in me1bm1 me2bm1 me3bm1 me4bm1 me5bm1 me1bm2 me2bm2 me3bm2 /*
		*/me4bm2 me5bm2 me1bm3 me2bm3 me3bm3 me4bm3 me5bm3 me1bm4 me2bm4 /*
		*/me3bm4 me4bm4 me5bm4 me1bm5 me2bm5 me3bm5 me4bm5 me5bm5{
reg er`x' rmrf if date>=196307 & date<=199112
}

// Replication of Table 6

foreach x in me1bm1 me2bm1 me3bm1 me4bm1 me5bm1 me1bm2 me2bm2 me3bm2 /*
		*/me4bm2 me5bm2 me1bm3 me2bm3 me3bm3 me4bm3 me5bm3 me1bm4 me2bm4 /*
		*/me3bm4 me4bm4 me5bm4 me1bm5 me2bm5 me3bm5 me4bm5 me5bm5{
reg er`x' rmrf smb hml if date>=196307 & date<=199112
}























