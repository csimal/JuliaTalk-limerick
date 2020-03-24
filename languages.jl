using StatsPlots
using PyPlot: xkcd

pyplot()
xkcd()

# By default, xkcd plots have a white outline around strokes, which looks derpy when saving figures, so we remove it
rcParams = PyPlot.PyDict(PyPlot.matplotlib."rcParams")
rcParams["path.effects"] = [PyPlot.matplotlib.patheffects.withStroke(linewidth=0, foreground="w")]

languages = repeat(["C", "Fortran", "Julia", "Matlab", "Python", "R"], outer=2)
usage = [7,4,6,10,2,3]
appreciation = [7,9,9,1,2,5]
ctg = repeat(["Usage", "Appreciation"], inner=6)

groupedbar(languages, hcat(usage, appreciation),
    group = ctg,
    yticks=[],
    grid=false,
    fontfamily="The Urban Way",
    bar_width=0.5,
    linewidth=1,
    dpi=200
    )

savefig("languages.png")
