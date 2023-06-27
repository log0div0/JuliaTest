
function ray_color(r::Ray, depth::Integer)::Vec3
	if depth == 0
		return Vec3(0,0,0)
	end

	hit = trace_ray(r, 0.0001, Inf)

	if hit isa Nothing
		return sky_color(r)
	end

	if !hit.front_face
		return Vec3(0,0,0)
	end

	material = materials[hit.material]
	attenuation, scattered_dir = scatter(material, r, hit)
	return attenuation.*ray_color(Ray(hit.p, scattered_dir), depth-1)
end

function render(samples_per_pixel, max_depth)

	aspect_ratio = 16 / 9
	image_width = 680
	image_height = Int64(image_width ÷ aspect_ratio)

	img = zeros(Pixel, image_height, image_width)

	cam = Camera(aspect_ratio)

	# Threads.@threads for j in 1:image_height
	@progress for j in 1:image_height
		for i in 1:image_width
			pixel = Vec3(0,0,0)
			for _ in 1:samples_per_pixel
				u = (i + rand()) / (image_width-1)
				v = (j + rand()) / (image_height-1)
				ray = get_ray(cam, u, v)
				pixel += ray_color(ray, max_depth)
			end
			img[image_height-j+1, i] = Pixel(sqrt.(pixel / samples_per_pixel)...)
		end
	end

	img

end
