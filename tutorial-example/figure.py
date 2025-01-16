import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import matplotlib.ticker as ticker

data = list(pd.read_csv("polybench.csv").to_dict(orient='index').values())
stencils = ["adi", "heat-3d", "jacobi-1d", "jacobi-2d", "fdtd-2d", "seidel-2d"]
data.sort(key=lambda x: "z"+x["name"] if x["name"] in stencils else x["name"])

labels = list(map(lambda x: x["name"], data))
group1_means = list(map(lambda x: x["low_calyx"]/x["structure"], data))
group2_means = list(map(lambda x: x["low_calyx"]/x["high_calyx"], data))
width = 0.35
x = np.arange(len(labels))

plt.yscale('log', base=4)
plt.ylim([4**0, 4**5])

rects1 = plt.bar(x - width/2, group1_means, width, label='Structure level')
rects2 = plt.bar(x + width/2, group2_means, width, label='High-level Calyx')

plt.gca().yaxis.set_minor_locator(ticker.NullLocator())

plt.ylabel('Simulation Speedup')
plt.xticks(x, labels, rotation=37, fontsize='small')
plt.legend()
plt.savefig("figure.png")
