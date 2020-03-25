using LightGraphs
using LightGraphs.SimpleGraphs
using DifferentialEquations
using Plots
using GraphRecipes

include("metapopulation.jl")

N = 10
P = 1000
volume = 1
frac_infected = 0.01
ninfected = Int(frac_infected*P)

g = complete_graph(N)
g = random_configuration_model(N,fill(3,N))
g = path_graph(N)

graphplot(g,
    nodeshape=:circle,
    nodesize=0.2)

V = fill(volume, N)
β = 0.3
μ = 0.1
tmax = 0.5

mp = Metapopulation(g,V,β,μ)

s0 = fill(P, N)
i0 = fill(ninfected, N)
i0 = zeros(Int, N)
s0[1] = P-ninfected
i0[1] = ninfected
Ptot = sum(s0) + sum(i0)

t, s, i = metapopulation_gillespie(mp,s0,i0, nmax = 1000000, tmax=tmax)

plot(t, sum(i, dims=2)/Ptot,
    label="",
    line=:steppre,
    xlabel="Time",
    ylabel="Fraction of infected individuals",
    )

plot(t,i/P,
    line=:steppre,
    label="",
    xlabel = "Time",
    ylabel = "Normalized #infected individuals",
    )


t_mc, s_mc, i_mc = metapopulation_montecarlo(mp,s0,i0,tmax=tmax, nmax=150000, nbins=200)

t_mf, s_mf, i_mf, sol = metapopulation_ode(mp, s0, i0, tmax=tmax, saveat=t_mc)

plot(t_mc, i_mc,
    label="",
    xlabel="Time",
    ylabel="#infected individuals",
    linestyle=:dash
    )
plot!(t_mf, i_mf, label="")

plot(t_mc, sum(i_mc, dims=2)/Ptot,
    label="Average",
    xlabel="Time",
    ylabel="Fraction of infected individuals",
    legend=:bottomright,
    linestyle=:dash
    )
plot!(t_mf, sum(i_mf, dims=2)/Ptot,
    label="Mean Field")
