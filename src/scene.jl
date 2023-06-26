
const materials = Material[]
const material_ground = length(push!(materials, Lambertian(Vec3(0.8, 0.8, 0.0))))
const material_center = length(push!(materials, Lambertian(Vec3(0.7, 0.3, 0.3))))
const material_left   = length(push!(materials, Metal(Vec3(0.8, 0.8, 0.8), 0.3)))
const material_right  = length(push!(materials, Metal(Vec3(0.8, 0.6, 0.2), 1.0)))

const world = Sphere[
	Sphere(Vec3( 0.0, -100.5, -1.0), 100.0, material_ground),
	Sphere(Vec3( 0.0,    0.0, -1.0),   0.5, material_center),
	Sphere(Vec3(-1.0,    0.0, -1.0),   0.5, material_left),
	Sphere(Vec3( 1.0,    0.0, -1.0),   0.5, material_right),
]
