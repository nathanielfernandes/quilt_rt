// rendering

fn trace(ray) {
    let t = INF
    let obj = none

    for object in OBJECTS {
        let curr_t, hit = object_intersection(object, ray)
        if hit {
            if curr_t < t {
                t = curr_t
            }
            obj = object
        }
    }

    (t, obj)
}

fn cast(ray, depth) {
    if depth >= MAX_DEPTH {
        return [0.0, 0.0, 0.0]
    }

    let t, obj = trace(ray)
    if obj == none {
        return [0.0, 0.0, 0.0]
    }

    compute_color(ray, t, obj, depth)  
}

fn diffuse_shading(material, point, normal) {
    let diffuse_color = [0.0, 0.0, 0.0]
    let specular_highlight = [0.0, 0.0, 0.0]

    let reflected = material[MAT_ALBEDO] / PI

    for light in LIGHTS {
        let light_dir = light_relative_direction(light, point)

        let shadow_ray_origin = vec3_add(point, vec3_mul_scalar(normal, SHADOW_BIAS))
        let shadow_ray = ray(shadow_ray_origin, light_dir)

        let shadow_t, obj = trace(shadow_ray)

        let intensity = if obj == none || shadow_t > light_relative_distance(light, point) {
            light_intensity_at(light, point)
        } else {
            0.0
        }

        let power = @max(vec3_dot(normal, light_dir), 0.0) * intensity

        diffuse_color = vec3_add(diffuse_color, vec3_mul_scalar(light[LIGHT_COLOR], power * reflected))

        let r = vec3_sub(light_dir, vec3_mul_scalar(normal, vec3_dot(light_dir, normal) * 2.0))

        let s = intensity * (@max(vec3_dot(r, vec3_neg(light_dir)), 0.0) ** material[MAT_PHONG_N] * material[MAT_PHONG_KS])
        specular_highlight = vec3_add(specular_highlight, [s, s, s])
    }

    vec3_mul(material[MAT_COLOR], vec3_add(diffuse_color, specular_highlight))
}

fn compute_color(ray, t, object, depth) {
    // return object[OBJ_MATERIAL][MAT_COLOR]
    let point = ray_at(ray, t)
    let normal = object_surface_normal(object, point)

    let material = object[OBJ_MATERIAL]

    let color = diffuse_shading(material, point, normal)

    let reflection = material[MAT_REFLECTIVITY]
    if reflection > 0.0 {
        let reflected_ray = ray_reflection(normal, ray[RAY_DIRECTION], point, SHADOW_BIAS)
        let reflected_color = cast(reflected_ray, depth + 1)
        color = vec3_mul_scalar(color, 1.0 - reflection)
        color = vec3_add(color, vec3_mul_scalar(reflected_color, reflection))
    }

    // color
    // object[OBJ_MATERIAL][MAT_COLOR]
    color
}


fn ray_trace(x, y) {
    let ray = prime_ray(x, y, WIDTH, HEIGHT, CAMERA_POSITION, FOV)
    vec3_to_color(cast(ray, 0))
}