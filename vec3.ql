// vec3 implementation
fn vec3(x, y, z) { [x, y, z] }
fn vec3_zero() { [0.0, 0.0, 0.0] }
fn vec3_from_color(c) { [c[0] / 255.0, c[1] / 255.0, c[2] / 255.0] }
fn vec3_to_color(v) { @rgb(v[0], v[1], v[2]) }

// math
fn vec3_add(v1, v2) { [v1[0] + v2[0], v1[1] + v2[1], v1[2] + v2[2]] }
fn vec3_sub(v1, v2) { [v1[0] - v2[0], v1[1] - v2[1], v1[2] - v2[2]] }
fn vec3_mul(v1, v2) { [v1[0] * v2[0], v1[1] * v2[1], v1[2] * v2[2]] }
fn vec3_div(v1, v2) { [v1[0] / v2[0], v1[1] / v2[1], v1[2] / v2[2]] }
fn vec3_neg(v) { [-v[0], -v[1], -v[2]] }

fn vec3_add_scalar(v, s) { [v[0] + s, v[1] + s, v[2] + s] }
fn vec3_mul_scalar(v, s) { [v[0] * s, v[1] * s, v[2] * s] }


// linear algebra
fn vec3_dot(v1, v2) { v1[0] * v2[0] + v1[1] * v2[1] + v1[2] * v2[2] }
// fn vec3_cross(v1, v2) { [v1[1] * v2[2] - v1[2] * v2[1], v1[2] * v2[0] - v1[0] * v2[2], v1[0] * v2[1] - v1[1] * v2[0]] }
fn vec3_norm(v) { v[0] * v[0] + v[1] * v[1] + v[2] * v[2] }
fn vec3_length(v) { @sqrt(vec3_norm(v)) }
fn vec3_normalize(v) {
    let len = vec3_length(v)
    [v[0] / len, v[1] / len, v[2] / len]
}
