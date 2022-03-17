import csv
import pandas as pd
import re
import matplotlib.pyplot as plt
import matplotlib
from matplotlib.pyplot import figure

plt.style.use('seaborn-whitegrid')

figure(figsize=(14, 6), dpi=80)

NAME = 'GEANT'
TIC = 5
id_x, id_y = 0, 93

with open('3-original-8-' + NAME + '.plot', 'r') as file:
    rows = []
    for row in file:
        x = re.split(r'\t+', row.rstrip('\t'))
        rows.append( x[:-1] )
    df_bw = pd.DataFrame(data=rows)
    df_bw.drop(df_bw.tail(1).index,inplace=True)

with open('3-original-5-' + NAME + '.plot', 'r') as file:
    rows = []
    for row in file:
        x = re.split(r'\t+', row.rstrip('\t'))
        rows.append( x[:-1] )
    df_energy = pd.DataFrame(data=rows)
    df_energy.drop(df_energy.tail(1).index,inplace=True)

with open('3-original-9-' + NAME + '.plot', 'r') as file:
    rows = []
    for row in file:
        x = re.split(r'\t+', row.rstrip('\t'))
        rows.append( x[:-1] )
    df_fuzzy = pd.DataFrame(data=rows)
    df_fuzzy.drop(df_fuzzy.tail(1).index,inplace=True)

x, y1, y2, y3, y1_lim, y2_lim, y3_lim = [], [], [], [], [], [], []
for i in range(0, df_fuzzy.shape[0], TIC):
    x.append(float(df_fuzzy[id_x].iloc[i]))
    
    y1.append(float(df_bw[id_y].iloc[i]))
    y1_lim.append(float(df_bw[id_y + 1].iloc[i]))
    
    y2.append(float(df_energy[id_y].iloc[i]))
    y2_lim.append(float(df_energy[id_y + 1].iloc[i]))

    y3.append(float(df_fuzzy[id_y].iloc[i]))
    y3_lim.append(float(df_fuzzy[id_y + 1].iloc[i]))

plt.plot(x, y1, color='chartreuse', marker='^', markersize=15, label='Bw')
plt.errorbar(x, y1, yerr=y1_lim, fmt='.k', color='chartreuse', ecolor='chartreuse', capsize=4)


plt.plot(x, y2, color='orange', marker='*', markersize=15, label='Energy')
plt.errorbar(x, y2, yerr=y2_lim, fmt='.k', color='orange', ecolor='orange', capsize=4)

plt.plot(x, y3, color='firebrick', marker='.', markersize=15, label='Fuzzy')
plt.errorbar(x, y3, yerr=y3_lim, fmt='.k', color='firebrick', ecolor='firebrick', capsize=4)

plt.xticks(x)
plt.yticks([i / 2 for i in range(0, 10)])

plt.yticks(fontsize=16)
plt.xticks(fontsize=16)

plt.ylabel('Number of Saturated Links', fontsize=20)
plt.xlabel('Number of Requests', fontsize=20)
plt.title('Average Saturated Links', fontsize=25)
plt.legend(fontsize=21)

plt.savefig('sat-bw-GEANT.pdf')