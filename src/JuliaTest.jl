module JuliaTest

using StaticArrays, Images, LinearAlgebra

const Vec3 = SVector{3, Float64}
const Pixel = RGB{Float64}
const MaterialID = UInt8

include("ray.jl")
include("materials.jl")
include("camera.jl")
include("sphere.jl")
include("render.jl")
include("scene.jl")

export render

end # module julia_test