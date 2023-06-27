
m = include("JuliaTest.jl")

m.render(1,1)
@time m.render(10,10)

