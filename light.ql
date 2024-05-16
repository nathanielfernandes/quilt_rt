// light object
let LIGHT_TYPE = 0
let LIGHT_DIRECTION, LIGHT_POSITION = (1, 1)
let LIGHT_COLOR = 2
let LIGHT_INTENSITY = 3

let DIRECTIONAL = 0
let SPHERICAL = 1

fn directional_light(direction, color, intensity) {
    let direction = vec3_normalize(direction)
    let color = vec3_from_color(color)
    [DIRECTIONAL, direction, color, intensity]
}

fn spherical_light(position, color, radius) {
    let color = vec3_from_color(color)
    [SPHERICAL, position, color, radius]
}

fn light_relative_direction(light, point) {
    switch light[LIGHT_TYPE] {
        case DIRECTIONAL { 
            light[LIGHT_DIRECTION]
        }
        case SPHERICAL { 
            vec3_normalize(vec3_sub(light[LIGHT_POSITION], point))
        }
    }
}

fn light_intensity_at(light, point) {
    switch light[LIGHT_TYPE] {
        case DIRECTIONAL { 
            light[LIGHT_INTENSITY] 
        }
        case SPHERICAL { 
            let r2 = vec3_norm(vec3_sub(light[LIGHT_POSITION], point))
            light[LIGHT_INTENSITY] / (4.0 * PI * r2)
        }
    }
}

fn light_relative_distance(light, point) {
    switch light[LIGHT_TYPE] {
        case DIRECTIONAL { 
            INF
        }
        case SPHERICAL { 
            vec3_length(vec3_sub(light[LIGHT_POSITION], point))
        }
    }
}