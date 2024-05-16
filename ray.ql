// ray

let RAY_ORIGIN = 0
let RAY_DIRECTION = 1

fn ray(origin, direction) {
    (origin, direction)
}

fn to_rad(deg) {
    deg * PI / 180.0
}

fn prime_ray(x, y, w, h, pos, fov) {
    let aspect = w / h
    
    let prime_x = (((x + 0.5) / w) * 2.0 - 1.0) * aspect * fov
    let prime_y = (1.0 - ((y + 0.5) / h) * 2.0) * fov

    let direction = vec3_normalize(vec3(prime_x, prime_y, -1.0))

    (pos, direction)
}

fn ray_at(ray, t) {
    vec3_add(ray[RAY_ORIGIN], vec3_mul_scalar(ray[RAY_DIRECTION], t))
}

fn ray_reflection(normal, incident, point, bias) {
    let origin = vec3_add(point, vec3_mul_scalar(normal, bias))
    let direction = vec3_sub(incident, vec3_mul_scalar(normal, 2.0 * vec3_dot(incident, normal)))
    (origin, direction)
}

