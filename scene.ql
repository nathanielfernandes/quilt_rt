// scene

let WIDTH = 256.0
let HEIGHT = 256.0
let FOV = @tan(to_rad(60.0) / 2.0)
let CAMERA_POSITION = vec3(0.0, 0.0, 0.0)
let MAX_DEPTH = 5
let SHADOW_BIAS = 0.001
let OBJECTS = []
let LIGHTS = []

fn set_dimensions(width, height) {
    WIDTH = @float(width)
    HEIGHT = @float(height)
}

fn set_fov(fov) {
    FOV = @tan(to_rad(fov) / 2.0)
}

fn set_camera_position(position) {
    CAMERA_POSITION = position
}

fn set_max_depth(depth) {
    MAX_DEPTH = @int(depth)
}

fn set_shadow_bias(bias) {
    SHADOW_BIAS = bias
}

fn add_object(object) {
    OBJECTS = [object] .. OBJECTS
}

fn add_light(light) {
    LIGHTS = [light] .. LIGHTS
}
