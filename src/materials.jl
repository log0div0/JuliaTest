
struct Lambertian
	albedo::Vec3
end

# this is used for Lambertian Reflection
function random_unit_vector()::Vec3
	# Using Gaussian distribution for all three coordinates of the vector will ensure an uniform distribution on the surface of the sphere.
	normalize(Vec3(randn(), randn(), randn()))
end

# WGLMakie.meshscatter([random_unit_vector() for _ in 1:10000], markersize=0.005)

function random_vector_in_unit_sphere()::Vec3
	random_unit_vector() * ∛rand()
end

# WGLMakie.meshscatter([random_vector_in_unit_sphere() for _ in 1:10000], markersize=0.005)

function scatter(material::Lambertian, r::Ray, hit::HitRecord)
	material.albedo, hit.normal + random_unit_vector()
end

reflect(v, n) = v - 2*v⋅n.*n

struct Metal
	albedo::Vec3
	fuzz::Float64
end

function scatter(material::Metal, r::Ray, hit::HitRecord)
	material.albedo, reflect(r.dir, hit.normal) + material.fuzz*random_vector_in_unit_sphere()
end

const Material = Union{Lambertian, Metal}

function sky_color(r::Ray)::Vec3
	t = 0.5*(r.dir.y+1.0)
	return (1.0-t)*Vec3(1,1,1) + t*Vec3(0.5, 0.7, 1.0)
end