module JuliaTest

using StaticArrays, Images, LinearAlgebra, ProgressLogging
import WGLMakie

const Vec3 = SVector{3, Float64}
const Pixel = RGB{Float64}
const MaterialID = UInt8

include("ray.jl")
include("sphere.jl")
include("materials.jl")
include("camera.jl")
include("render.jl")

end # module JuliaTest