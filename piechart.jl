using Plots
using PyPlot: xkcd

pyplot()
xkcd()

# Once again we must tinker with pyplot internals, because someone, somewhere didn't font swapping for pie charts
rcParams = PyPlot.PyDict(PyPlot.matplotlib."rcParams")
rcParams["font.family"] = ["The Urban Way"]
rcParams["font.size"] = 12.0

topics = ["Numerical Analysis", "Networks", "Dynamical Systems", "Statistics"]
percents = [0.4,0.25,0.25,0.1]

pie(topics, percents)

savefig("piechart.png")
