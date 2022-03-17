#!/usr/bin/awk -f

#Distribuição t		80.00%	90.00%	95.00%	99.00%	99.99%
#inf                   1.282	1.645	1.96	2.576	3.291
#                      1.299 	1.676 	2.009   2.678   3.496

#Req     100     65   
#4-27 
#1000.000000     1000.000000     623.437500      626.906250      615.000000      528.187500      589.906250      701.437500      602.718750      733.375000      642.906250      641.000000      666.718750      728.031250      633.968750      639.812500      699.656250      683.656250      567.343750      622.375000      662.500000      629.750000      585.500000      681.218750
#28-41
#    0.000000        0.000000        4.000000        4.000000        3.000000        8.000000        5.0000001.000000        2.000000        0.000000        3.000000        2.000000        2.000000        1.000000        4.000000       3.000000 1.000000        2.000000        3.000000        4.000000        2.000000        2.000000        5.000000        1.000000
#42-73
#0.343511        0.446364        0.533762        0.635201        0.627963        0.615075        0.748975        0.451185       0.618971 0.433909        0.680466        0.600643        0.371233        0.609080        0.439728        0.359253        0.4720770.560289        0.438103        0.684513        0.565803        0.598232        0.540997        0.521896

BEGIN {
FATORT=1.645;
VETOR[S+1];
VETORCONF[S+1];

VETORBW[S+1,25];
VETORBWCONF[S+1,26];

VETORSAT[S+1,25];
VETORSATCONF[S+1,26];

VETOREN[S+1,25];
VETORENCONF[S+1,26];

VETORMIG[S+1];
VETORMIGCONF[S+1];
total[S+1];
}
/Req/{
VETOR[$2]+=$3;VETORCONF[$2]+=$3*$3;
time=0;
for (i = 4; i < 28; i++) {VETORBW[$2,time]+=$(i); VETORBWCONF[$2,time]+=$(i)*$(i);time++;};
time=0;
for (i = 28; i < 52; i++) {VETORSAT[$2,time]+=$(i); VETORSATCONF[$2,time]+=$(i)*$(i);time++;};
time=0;
for (i = 52; i < 76; i++) {VETOREN[$2,time]+=$(i); VETORENCONF[$2,time]+=$(i)*$(i);time++;};

if ($76 != -1){VETORMIG[$2]+=$76; VETORMIGCONF[$2]+=$76*$76;total[$2]++;}
}

END{

final=25;

#NUM eh parametro;
for (i=0; i<=S; i++){
	
	VETORCONF[i] = (FATORT*(sqrt( VETORCONF[i]/NUM-(VETOR[i]/NUM)^2)/sqrt(NUM)));
	VETOR[i]=VETOR[i]/NUM;

	printf "%d\t%.2f\t%.2f\t", i, VETOR[i],VETORCONF[i];

	for (j = 0; j < 24; j++) {
		VETORBWCONF[i,j] = (FATORT*(sqrt( VETORBWCONF[i,j]/NUM-(VETORBW[i,j]/NUM)^2)/sqrt(NUM)));
		VETORBW[i,j]=VETORBW[i,j]/NUM;

		printf "%.2f\t%.2f\t", VETORBW[i,j],VETORBWCONF[i,j];
	
		VETORBW[i,final]+=VETORBW[i,j];
		VETORBWCONF[i,final]+=VETORBWCONF[i,j];

	}

	printf "%.2f\t%.2f\t", VETORBW[i,final]/24,VETORBWCONF[i,final]/24;

	for (j = 0; j < 24; j++) {

		VETORSATCONF[i,j] = (FATORT*(sqrt( VETORSATCONF[i,j]/NUM-(VETORSAT[i,j]/NUM)^2)/sqrt(NUM)));
		VETORSAT[i,j]=VETORSAT[i,j]/NUM;

		printf "%.2f\t%.2f\t",VETORSAT[i,j],VETORSATCONF[i,j];

		VETORSAT[i,final]+=VETORSAT[i,j];
		VETORSATCONF[i,final]+=VETORSATCONF[i,j];

	}

	printf "%.2f\t%.2f\t", VETORSAT[i,final]/24,VETORSATCONF[i,final]/24;

	for (j = 0; j < 24; j++) {

		VETORENCONF[i,j] = (FATORT*(sqrt( VETORENCONF[i,j]/NUM-(VETOREN[i,j]/NUM)^2)/sqrt(NUM)));
		VETOREN[i,j]=VETOREN[i,j]/NUM;

		printf "%.2f\t%.2f\t", VETOREN[i,j],VETORENCONF[i,j];

		VETOREN[i,final]+=VETOREN[i,j];
		VETORENCONF[i,final]+=VETORENCONF[i,j];

	}

	printf "%.2f\t%.2f\t", VETOREN[i,final]/24,VETORENCONF[i,final]/24;

	if(total[i]!=0){
	VETORMIGCONF[i] = (FATORT*(sqrt( VETORMIGCONF[i]/total[i]-(VETORMIG[i]/total[i])^2)/sqrt(total[i])));
	VETORMIG[i]=VETORMIG[i]/total[i];
	}
	else{
	VETORMIGCONF[i] = 0;
	VETORMIG[i]= 0;
	}


	printf "%.2f\t%.2f\t", VETORMIG[i],VETORMIGCONF[i];
	
	printf "\n";
	
}

printf "\n";
}
