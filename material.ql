// material

let MAT_ALBEDO, MAT_REFLECTIVITY, MAT_COLOR, MAT_PHONG_N, MAT_PHONG_KS = [0, 1, 2, 3, 4]

fn material(color, albedo, reflectivity, phong_n, phong_ks) {
    let c = vec3_from_color(color)
    [albedo, reflectivity, c, phong_n, phong_ks]
}

fn shiny_material(color, albedo, reflectivity) {
    material(color, albedo, reflectivity, 1250.0, 0.2)
}

fn matte_material(color, albedo) {
    material(color, albedo, 0.0, 0.0, 0.0)
}
