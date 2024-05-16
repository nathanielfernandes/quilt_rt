// object

let OBJ_TYPE = 0
let OBJ_ORIGIN = 1
let OBJ_NORMAL, OBJ_RADIUS = (2, 2)
let OBJ_MATERIAL = 3

let SPHERE = 0
let PLANE = 1


fn sphere(origin, radius, material) {
    [SPHERE, origin, radius, material]
}

fn plane(origin, normal, material) {
    [PLANE, origin, normal, material]
}

fn object_surface_normal(obj, point) {
    switch obj[OBJ_TYPE] {
        case SPHERE { 
            vec3_normalize(vec3_sub(point, obj[OBJ_ORIGIN]))
        }
        case PLANE { 
            vec3_neg(obj[OBJ_NORMAL])
        }
    }
}

fn object_intersection(obj, ray) {
    switch obj[OBJ_TYPE] {
        case SPHERE { 
            let line = vec3_sub(obj[OBJ_ORIGIN], ray[RAY_ORIGIN])
            let adjacent = vec3_dot(line, ray[RAY_DIRECTION])
            let distance = vec3_norm(line) - (adjacent * adjacent)

            let radius = obj[OBJ_RADIUS] * obj[OBJ_RADIUS]

            if distance > radius {
                return (INF, false)
            }

            let bounds = @sqrt(radius - distance)
            let t1 = adjacent - bounds
            let t2 = adjacent + bounds

            if t1 < 0.0 && t2 < 0.0 {
                return (INF, false)
            }

            if t1 < t2 {
                (t1, true)
            } else {
                (t2, true)
            }
        }
        case PLANE { 
            let normal = obj[OBJ_NORMAL]
            let denom = vec3_dot(normal, ray[RAY_DIRECTION])

            if denom > EPSILON {
                let v = vec3_sub(obj[OBJ_ORIGIN], ray[RAY_ORIGIN])
                let t = vec3_dot(v, normal) / denom
                if t >= 0.0 {
                   return (t, true)
                }
            }

            return (INF, false)
        }
    }
}