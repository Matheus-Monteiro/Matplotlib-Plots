#!/usr/bin/awk -f

#Distribuição t	80.00%	90.00%	95.00%	99.00%	99.99%
#inf                   1.282	1.645	1.96	2.576	3.291
#                      1.299 	1.676 	2.009   2.678   3.496

BEGIN {
FATORT=1.645;
#print "Percent\t",Bw\t","TimeTop\t","TopIntConf\t","ProbSt\t","TimeOrdAlg\t","OrdIntConf\t","Xl\t","Xu\t","CommLow\t","CommUp\t","TimeReliab\t","RelIntConf\t"
}
/FailureInfo/ {

A1+=$3;
A2+=$5;
A3+=$7;
A4+=$9;
A5+=$11;
A10+=$13;
A25+=$15;
A50+=$17;
A100+=$19;

A1q+=$3*$3;
A2q+=$5*$5;
A3q+=$7*$7;
A4q+=$9*$9;
A5q+=$11*$11;
A10q+=$13*$13;
A25q+=$15*$15;
A50q+=$17*$17;
A100q+=$19*$19;

}

END{
#NUM eh parametro;

ConfA1= (FATORT*(sqrt((A1q)/NUM-(A1/NUM)^2)/sqrt(NUM)));
ConfA2= (FATORT*(sqrt((A2q)/NUM-(A2/NUM)^2)/sqrt(NUM)));
ConfA3= (FATORT*(sqrt((A3q)/NUM-(A3/NUM)^2)/sqrt(NUM)));
ConfA4= (FATORT*(sqrt((A4q)/NUM-(A4/NUM)^2)/sqrt(NUM)));
ConfA5= (FATORT*(sqrt((A5q)/NUM-(A5/NUM)^2)/sqrt(NUM)));
ConfA10= (FATORT*(sqrt((A10q)/NUM-(A10/NUM)^2)/sqrt(NUM)));
ConfA25= (FATORT*(sqrt((A25q)/NUM-(A25/NUM)^2)/sqrt(NUM)));
ConfA50= (FATORT*(sqrt((A50q)/NUM-(A50/NUM)^2)/sqrt(NUM)));
ConfA75= (FATORT*(sqrt((A75q)/NUM-(A75/NUM)^2)/sqrt(NUM)));
ConfA100= (FATORT*(sqrt((A100q)/NUM-(A100/NUM)^2)/sqrt(NUM)));

#printf "Region\t";
#printf "%d\t",A;
#printf "%s\n",NAME;

printf "%s\t", $2;
printf "%.2f\t",A1/NUM;
printf "%.2f\n", ConfA1;
printf "%s\t", $4;
printf "%.2f\t",A2/NUM;
printf "%.2f\n", ConfA2;
printf "%s\t", $6;
printf "%.2f\t",A3/NUM;
printf "%.2f\n", ConfA3;

printf "%s\t", $8;
printf "%.2f\t",A4/NUM;
printf "%.2f\n", ConfA4;
printf "%s\t", $10;
printf "%.2f\t",A5/NUM;
printf "%.2f\n", ConfA5;
printf "%s\t", $12;
printf "%.2f\t",A10/NUM;
printf "%.2f\n", ConfA10;

printf "%s\t", $14;
printf "%.2f\t",A25/NUM;
printf "%.2f\n", ConfA25;
printf "%s\t", $16;
printf "%.2f\t",A50/NUM;
printf "%.2f\n", ConfA50;
printf "%s\t", $18;
printf "%.2f\t",A75/NUM;
printf "%.2f\n", ConfA75;

printf "%s\t", $20;
printf "%.2f\t",A100/NUM;
printf "%.2f\n", ConfA100;

printf "\n";

}
