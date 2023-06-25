
struct Ray
	orig::Vec3
	dir::Vec3
	Ray(orig::Vec3, dir::Vec3) = new(orig, normalize(dir))
end

function (r::Ray)(t::Real)::Vec3
	r.orig + r.dir*t
end

struct HitRecord
	p::Vec3
	normal::Vec3
	t::Float64
	front_face::Bool
	material::MaterialID
end

function trace_ray(r::Ray, t_min::Float64, t_max::Float64)::Union{HitRecord, Nothing}
	hit = nothing
	closest_so_far = t_max
	for obj in world
		obj_hit = find_intersection(obj, t_min, closest_so_far, r)
		if !(obj_hit isa Nothing)
			hit = obj_hit
			closest_so_far = obj_hit.t;
		end
	end
	hit
end
