
const materials = Material[]
const material_ground = length(push!(materials, Lambertian(Vec3(0.8, 0.8, 0.0))))
const material_center = length(push!(materials, Lambertian(Vec3(0.7, 0.3, 0.3))))
const material_left   = length(push!(materials, Metal(Vec3(0.8, 0.8, 0.8))))
const material_right  = length(push!(materials, Metal(Vec3(0.8, 0.6, 0.2))))

const world = Sphere[
	Sphere(Vec3( 0.0, -100.5, -1.0), 100.0, material_ground, 1),
	Sphere(Vec3( 0.0,    0.0, -1.0),   0.5, material_center, 2),
	Sphere(Vec3(-1.0,    0.0, -1.0),   0.5, material_left, 3),
	Sphere(Vec3( 1.0,    0.0, -1.0),   0.5, material_right, 4),
]