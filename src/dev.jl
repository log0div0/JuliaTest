
(;render, Material, Vec3, Lambertian, Metal, Sphere) = include("JuliaTest.jl")

materials = Material[]
material_ground = length(push!(materials, Lambertian(Vec3(0.8, 0.8, 0.0))))
material_center = length(push!(materials, Lambertian(Vec3(0.7, 0.3, 0.3))))
material_left   = length(push!(materials, Metal(Vec3(0.8, 0.8, 0.8), 0.3)))
material_right  = length(push!(materials, Metal(Vec3(0.8, 0.6, 0.2), 1.0)))

objects = Sphere[
	Sphere(Vec3( 0.0, -100.5, -1.0), 100.0, material_ground),
	Sphere(Vec3( 0.0,    0.0, -1.0),   0.5, material_center),
	Sphere(Vec3(-1.0,    0.0, -1.0),   0.5, material_left),
	Sphere(Vec3( 1.0,    0.0, -1.0),   0.5, material_right),
]

render(objects, materials, samples_per_pixel=1, max_depth=1)
@time render(objects, materials, samples_per_pixel=100, max_depth=50)

