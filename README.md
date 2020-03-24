# So you're interested in Julia?

The Julia language is a young programming language designed to provide the abstraction and ease of use of languages like Python, R or Matlab, while offering performance on par with C or Fortran. In this talk, I go through my experience learning Julia over the last 6 months, the design behind Julia's performance and give an overview of Julia's current package ecosystem. This talk is meant as an introduction for people curious about Julia.

Slides and code from my March 2020 Julia talk

The slides were made with [Marp](https://marp.app/).

All code examples were made in Julia 1.3.1, but they should work on 1.2.0 as well.

## Links and Resources
The latest version of Julia can be downloaded on the [official website](https://julialang.org/). The creators of Julia have also started a company called [Julia Computing](https://juliacomputing.com/), that provides various services around Julia, including editor support and curated packages.

## Sales pitch
Here are some links for those looking for more arguments in favour of Julia. 

* [Julia:  A Fast Dynamic Language for Technical Computing](https://arxiv.org/pdf/1209.5145.pdf) : The 2012 paper in which Julia was unveiled by its creators.
* [Why we created Julia](https://julialang.org/blog/2012/02/why-we-created-julia/) : a blog post stating their reasons for creating Julia.
* [Automatic Differentiation in 10 minutes with Julia](https://www.youtube.com/watch?v=vAp6nUMrKYg) : a short video by one of Julia's creators showcasing how Julia's design enables doing Automatic Differentiation, i.e. *exact* computation of derivatives *without* symbolic computation in a manner that is both efficient and elegant.
* [SC19 Awards Presentation: IEEE-CS Sidney Fernbach Award - Alan Edelman, MIT](https://www.youtube.com/watch?v=nwdGsz4rc3Q) : One of the creators of Julia talking about High Performance Computing, and how Julia was designed with it in mind.
* [JuliaCon 2018 | Why Julia is the most suitable language for science | George Datseris](https://www.youtube.com/watch?v=7y-ahkUsIrY) : Another talk in the same vein as mine, that covers some features of Julia I didn't talk about.

## Benchmarks
One of Julia's main selling points is the ability to have the performance of C with the flexibility of Python. Here are a few benchmarks to back that up with numbers. Some of those are pretty old and/or may not be entirely up to snuff.
* [Julia Micro-Benchmarks](https://julialang.org/benchmarks/) : A pretty old set of benchmarks. Take those with a grain of salt.
* [Basic Comparison of Python, Julia, Matlab, IDL and Java (2019 Edition)](https://modelingguru.nasa.gov/docs/DOC-2783) : A comprehensive comparison of the main scientific computing languages. Note that the version of Julia used was already outdated when they made it.
* [Julia vs R: Freeing the data scientist mind from the curse of vectoRization](https://towardsdatascience.com/freeing-the-data-scientist-mind-from-the-curse-of-vectorization-11634c370107) : A comparison of R and Julia made in August 2019.
* [Benchmark of popular graph / network packages](https://github.com/timlrx/graph-benchmarks) : A comparison of libraries for network analysis, including Julia's [LightGraphs.jl](https://github.com/JuliaGraphs/LightGraphs.jl) package.

### Workflow
Julia can be used from the command line in REPL form, much like R, but the [JuliaPro](https://juliacomputing.com/products/juliapro) editor, which is based on Atom, provides a workflow analogous to Rstudio or Matlab. Alternatively, one can use Jupyter Notebooks. Other editors, such as VS Code, Vim or IDEA are also supported, but nowhere near the level of polish of JuliaPro.

### Learning Julia
Given the amount of interest (and funding) Julia is getting, it's no surprise that there are plenty of [learning resources](https://julialang.org/learning/). I found the [manual](https://docs.julialang.org/en/v1/) and the occasional visit to stackoverflow to be all I need, but your mileage may vary. Users coming to Julia from another language should check out [this page](https://docs.julialang.org/en/v1/manual/noteworthy-differences/)

### Packages
Although Julia's package ecosystem is not quite mature yet compared to Python or R, contributing to packages and publishing new ones is extremely easy, as the majority of them are hosted on github under an open source license. In addition, some important packages are curated by JuliaComputing, meaning you can expect them to be well maintained and documented.

Some packages include

* **Networks:** [LightGraphs.jl](https://github.com/JuliaGraphs/LightGraphs.jl) is an excellent package for network analysis, including generators for a wide array of static and random network models and a plethora of network algorithms. It is the core of the wider [JuliaGraphs](https://juliagraphs.github.io/) ecosystem.

* **Numerical integration and Dynamical Systems:** [DifferentialEquations.jl](https://docs.juliadiffeq.org/dev/index) is a massive suite of solvers for differential equations. If you believe [this blog post](http://www.stochasticlifestyle.com/comparison-differential-equation-solver-suites-matlab-r-julia-python-c-fortran/) by the main author of the package, it is the most comprehensive suite of solvers on the market today. [DynamicalSystems.jl](https://juliadynamics.github.io/DynamicalSystems.jl/latest/) is a suite of packages that builds on top of DifferentialEquations.jl to provide tools for analysing general dynamical systems.

* **Statistics:** While I haven't looked much into it myself, there seems to be a fair few packages dedicated to statistics, among which [DataFrames.jl](https://github.com/JuliaData/DataFrames.jl), [StatsBase.jl](https://github.com/JuliaStats/StatsBase.jl), [Distributions.jl](https://github.com/JuliaStats/Distributions.jl), [HypothesisTests.jl](https://github.com/JuliaStats/HypothesisTests.jl) and [GLM.jl](https://github.com/JuliaStats/GLM.jl). You can find more on the JuliaComputing website.

* **Machine Learning:** As you would expect, this is a major focus of the language, so there are a ton of packages, including the pure Julia [Flux.jl](https://github.com/FluxML/Flux.jl) as well as wrappers like [TensorFlow.jl](https://github.com/malmaud/TensorFlow.jl) or [ScikitLearn.jl](https://github.com/cstjean/ScikitLearn.jl).

* **Plotting:** 
Your first stop should be [Plots.jl](https://github.com/JuliaPlots/Plots.jl), which provides an interface over multiple plotting backends, meaning you can switch to pyplot with a single call, and all your plotting code will work without modifications. Statistics people should look into [StatsPlots.jl](https://github.com/JuliaPlots/StatsPlots.jl) and [Gadfly.jl](http://gadflyjl.org/stable/). Note that Plots.jl is mostly intended for creating static plots without interactivity. [Makie.jl](http://makie.juliaplots.org/stable/index.html) is a package currently under development that aims to bring the ideas from Plots.jl to the next level in an interactive way. I can't quite recommend it yet, however, since I couldn't get it to work.

* **Interfacing with other languages:**
Switching to Julia doesn't mean you have to throw away your old code. You can natively [call C and Fortran functions](https://docs.julialang.org/en/v1/manual/calling-c-and-fortran-code/index.html) and there are bindings for [C++](https://github.com/JuliaInterop/Cxx.jl), [Python](https://github.com/JuliaPy/PyCall.jl), [R](https://github.com/JuliaInterop/RCall.jl) and [many more](https://github.com/JuliaInterop).

### Miscelaneous
* [JuliaCon 2019 | The Unreasonable Effectiveness of Multiple Dispatch | Stefan Karpinski](https://www.youtube.com/watch?v=kc9HwsxE1OY)
* [JuliaLang: The Ingredients for a Composable Programming Language](https://white.ucc.asn.au/2020/02/09/whycompositionaljulia.html) : A blog post about how Julia manages to be se remarkably composable.
