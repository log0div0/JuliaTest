
struct Sphere
	center::Vec3
	radius::Float64
	material::MaterialID
end

function solve_quad_eq(a, b, c)
	d = b^2 - 4a*c
	if d >= 0
		x1 = (-b - √d) / 2a
		x2 = (-b + √d) / 2a
		x1, x2
	end
end

function find_intersection(sphere::Sphere, t_min::Float64, t_max::Float64, ray::Ray)::Union{HitRecord, Nothing}
	b = ray.dir
	A = ray.orig
	C = sphere.center
	R = sphere.radius
	roots = solve_quad_eq(b⋅b, 2b⋅(A-C), (A-C)⋅(A-C) - R^2)
	if !isnothing(roots)
		index = findfirst(x -> t_min<=x<=t_max, roots)
		if !isnothing(index)
			t = roots[index]
			p = ray(t)
			outward_normal = (p - sphere.center) / sphere.radius
			front_face = (ray.dir⋅outward_normal) < 0
			normal = front_face ? outward_normal : -outward_normal
			return HitRecord(p, normal, t, front_face, sphere.material)
		end
	end
end
