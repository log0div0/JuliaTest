
struct Camera
	origin::Vec3
	lower_left_corner::Vec3
	horizontal::Vec3
	vertical::Vec3

	function Camera(aspect_ratio::Float64)
		focal_length = 1.0
		viewport_height = 2.0
		viewport_width = aspect_ratio * viewport_height
		horizontal = Vec3(viewport_width,0,0)
		vertical = Vec3(0,viewport_height,0)
		origin = Vec3(0,0,0)
		lower_left_corner = origin - horizontal/2 - vertical/2 - Vec3(0,0,focal_length)
		new(origin,lower_left_corner, horizontal, vertical)
	end
end

function get_ray(cam::Camera, u::Float64, v::Float64)::Ray
	Ray(cam.origin, cam.lower_left_corner + u*cam.horizontal + v*cam.vertical - cam.origin)
end
