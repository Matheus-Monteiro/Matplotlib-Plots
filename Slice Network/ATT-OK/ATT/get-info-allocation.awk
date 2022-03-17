#!/usr/bin/awk -f

#Distribuição t	80.00%	90.00%	95.00%	99.00%	99.99%
#inf                   1.282	1.645	1.96	2.576	3.291
#                      1.299 	1.676 	2.009   2.678   3.496

BEGIN {
FATORT=1.676;
#print "Percent\t",Bw\t","TimeTop\t","TopIntConf\t","ProbSt\t","TimeOrdAlg\t","OrdIntConf\t","Xl\t","Xu\t","CommLow\t","CommUp\t","TimeReliab\t","RelIntConf\t"
}
/Solved/{suc+=$2;rel+=$4;bw+=$6;sucQ+=$2*$2;relQ+=$4*$4;bwQ+=$6*$6;}
END{
#NUM eh parametro;
ConfSuc = (FATORT*(sqrt(sucQ/NUM-(suc/NUM)^2)/sqrt(NUM)));
ConfRel = (FATORT*(sqrt(relQ/NUM-(rel/NUM)^2)/sqrt(NUM)));
ConfBw = (FATORT*(sqrt(bwQ/NUM-(bw/NUM)^2)/sqrt(NUM)));
if(suc/NUM+rel/NUM+bw/NUM < NUM){a = NUM-(suc/NUM+rel/NUM+bw/NUM); suc=a+suc};
printf "%s\t", NAME;
printf "%.2f\t", suc/NUM;
printf "%.2f\t", ConfSuc;
printf "%.2f\t", rel/NUM;
printf "%.2f\t", ConfRel;
printf "%.2f\t", bw/NUM;
printf "%.2f\n", ConfBw;
}
