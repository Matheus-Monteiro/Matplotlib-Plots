import matplotlib.pyplot as plt
import matplotlib

fig, ax = plt.subplots()
line, = ax.plot([], [])
ax.grid()

plt.plot([1, 1.5, 2.0, 2.5, 3.0], [1, 0.5, 0, 0, 0], color='chartreuse', marker='o', linewidth=2.2, markersize=10)
plt.plot([1.0, 1.5, 2.0, 2.5, 3.0], [0, 0, 0, 0.5, 1], color='orange', marker='*', linewidth=2, markersize=10)
plt.plot([1, 1.5, 2.0, 2.5, 3.0], [0, 0.5, 1, 0.5, 0], color='firebrick', marker='^', linewidth=1.5, markersize=10)

plt.yticks([0.0, 0.2, 0.4, 0.6, 0.8, 1.0])
plt.xticks([1.0, 1.5, 2.0, 2.5, 3.0])

ax = plt.gca()
ax.set_frame_on(False)

plt.yticks(fontsize=16)
plt.xticks(fontsize=16)
plt.ylabel('Degree of Relevance', fontsize=20)
plt.savefig('Score.pdf')