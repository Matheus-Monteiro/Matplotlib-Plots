NAME=$1
REQ=$2
TIC=5

gnuplot -e "plot 

'3-original-8-$NAME.plot' every $TIC u 1:94:95 with yerrorbars linewidth 1 lt 1 pt 3 lc rgb 'orange', 
'3-original-8-$NAME.plot' every $TIC u 1:94:95 title 'Bw' with linespoints lw 2 lt 1 pt 3  ps 2 lc rgb 'orange', 

'3-original-5-$NAME.plot' every $TIC u 1:94:95 with yerrorbars linewidth 1 lt 1 pt 5 lc rgb 'red', 
'3-original-5-$NAME.plot' every $TIC u 1:94:95 title 'Energy' with linespoints lw 2 lt 1 pt 5  ps 2 lc rgb 'red', 

'3-original-9-$NAME.plot' every $TIC u 1:94:95 with yerrorbars linewidth 1 lt 1 pt 13 lc rgb 'dark-blue', 
'3-original-9-$NAME.plot' every $TIC u 1:94:95 title 'Fuzzy' with linespoints lw 2 lt 1 pt 13  ps 2 lc rgb 'dark-blue'; 


set terminal postscript color enhanced 'Helvetica' 25 landscape size 16,8;
set output 'sat-bw-$NAME.eps' ;
unset key;
set title 'Average Saturated Links';
set xlabel 'Number of Requests';
set ylabel 'Number of Saturated Links';
set grid;
set xrange [1:($REQ+1)];
set yrange [0:15];
set xtics 5 ;
set key horiz ;
set key bottom out;
set key noautotitles;
replot"

gnuplot -e "plot 

'3-original-8-$NAME.plot' every $TIC u 1:152:153 with yerrorbars linewidth 1 lt 1 pt 3 lc rgb 'orange', 
'3-original-8-$NAME.plot' every $TIC u 1:152:153 title 'Bw' with linespoints lw 2 lt 1 pt 3  ps 2 lc rgb 'orange', 

'3-original-5-$NAME.plot' every $TIC u 1:152:153 with yerrorbars linewidth 1 lt 1 pt 5 lc rgb 'red', 
'3-original-5-$NAME.plot' every $TIC u 1:152:153 title 'Energy' with linespoints lw 2 lt 1 pt 5  ps 2 lc rgb 'red', 

'3-original-9-$NAME.plot' every $TIC u 1:152:153 with yerrorbars linewidth 1 lt 1 pt 13 lc rgb 'dark-blue', 
'3-original-9-$NAME.plot' every $TIC u 1:152:153 title 'Fuzzy' with linespoints lw 2 lt 1 pt 13  ps 2 lc rgb 'dark-blue'; 

set terminal postscript color enhanced 'Helvetica' 25 landscape size 16,8;
set output 'energy-$NAME-$HOSTNAME.eps' ;
unset key;
set title 'Average Energy Efficiency';
set ylabel 'Bw Allocated / Energy Consumption';
set xlabel 'Number of Requests';
set grid;
set xrange [0:($REQ+1)];
set xtics $TIC ;
set key horiz ;
set key bottom out;
set key noautotitles;
replot"

gnuplot -e "plot 

'3-original-8-$NAME.plot' every $TIC u 1:2:3 with yerrorbars linewidth 1 lt 1 pt 3 lc rgb 'orange', 
'3-original-8-$NAME.plot' every $TIC u 1:2:3 title 'Bw' with linespoints lw 2 lt 1 pt 3  ps 2 lc rgb 'orange', 

'3-original-5-$NAME.plot' every $TIC u 1:2:3 with yerrorbars linewidth 1 lt 1 pt 5 lc rgb 'red', 
'3-original-5-$NAME.plot' every $TIC u 1:2:3 title 'Energy' with linespoints lw 2 lt 1 pt 5  ps 2 lc rgb 'red', 

'3-original-9-$NAME.plot' every $TIC u 1:2:3 with yerrorbars linewidth 1 lt 1 pt 13 lc rgb 'dark-blue', 
'3-original-9-$NAME.plot' every $TIC u 1:2:3 title 'Fuzzy' with linespoints lw 2 lt 1 pt 13  ps 2 lc rgb 'dark-blue'; 

set terminal postscript color enhanced 'Helvetica' 25 landscape size 20,8;
set output 'sucess-req-$NAME-$HOSTNAME.eps' ;
unset key;
set title 'Allocation Status';
set xlabel 'Number of Requests';
set ylabel 'Successful Allocations';
set grid;
set xrange [0:($REQ+1)];
set xtics $TIC ;
set key horiz ;
set key bottom out;
set key noautotitles;
replot"

gnuplot -e "plot 

'3-original-8-$NAME.plot' every $TIC u 1:52:53 with yerrorbars linewidth 1 lt 1 pt 3 lc rgb 'orange', 
'3-original-8-$NAME.plot' every $TIC u 1:52:53 title 'Bw' with linespoints lw 2 lt 1 pt 3  ps 2 lc rgb 'orange', 

'3-original-5-$NAME.plot' every $TIC u 1:52:53 with yerrorbars linewidth 1 lt 1 pt 5 lc rgb 'red', 
'3-original-5-$NAME.plot' every $TIC u 1:52:53 title 'Energy' with linespoints lw 2 lt 1 pt 5  ps 2 lc rgb 'red', 

'3-original-9-$NAME.plot' every $TIC u 1:52:53 with yerrorbars linewidth 1 lt 1 pt 13 lc rgb 'dark-blue', 
'3-original-9-$NAME.plot' every $TIC u 1:52:53 title 'Fuzzy' with linespoints lw 2 lt 1 pt 13  ps 2 lc rgb 'dark-blue'; 

set terminal postscript color enhanced 'Helvetica' 25 landscape size 20,8;
set output 'avail-bw-$NAME-$HOSTNAME.eps' ;
unset key;
set title 'Average Available Bandwidth';
set xlabel 'Number of Requests';
set ylabel 'Bandwidth (Mbps)';
set grid;
set xrange [0:($REQ+1)];
set xtics $TIC ;
set key horiz ;
set key bottom out;
set key noautotitles;
replot"
