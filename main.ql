include "constants.ql"
include "vec3.ql"
include "ray.ql"
include "material.ql"
include "object.ql"
include "light.ql"
include "scene.ql"
include "rendering.ql"
include "ppm.ql"


let width, height = (512, 256)

set_dimensions(width, height)
set_camera_position(vec3(0.0, 0.0, 20.0))
set_fov(60.0)

add_object(
    sphere(
        vec3(0.0, 2.0, -8.0),
        4.0,
        material(#ffffff, 0.2, 0.9, 0.0, 0.0)
    )
)

add_object(
    plane(
        vec3(0.0, -4.5, 0.0),
        vec3(0.0, -1.0, 0.0),
        material(#000000, 0.1, 0.9, 0.0, 0.0)
    )
)

add_object(
    plane(
        vec3(0.0, 0.0, -20.0),
        vec3(0.0, 0.0, -1.0),
        material(#ffffff, 0.1, 0.8, 0.0, 0.0)
    )
)

add_light(
    spherical_light(
        vec3(-30.0, 20.0, -2.0),
        #ff0000,
        20000.0
    )
)

add_light(
    spherical_light(
        vec3(-20.0, 20.0, -2.0),
        #fc1e26,
        20000.0
    )
)

add_light(
    spherical_light(
        vec3(-10.0, 20.0, -2.0),
        #ffd640,
        20000.0
    )
)

add_light(
    spherical_light(
        vec3(0.0, 20.0, -2.0),
        #00ff00,
        20000.0
    )
)

add_light(
    spherical_light(
        vec3(10.0, 20.0, -2.0),
        #0032ff,
        20000.0
    )
)

add_light(
    spherical_light(
        vec3(20.0, 20.0, -2.0),
        #bd38ff,
        20000.0
    )
)

add_light(
    spherical_light(
        vec3(30.0, 20.0, -2.0),
        #ff54e8,
        20000.0
    )
)

add_light(
    spherical_light(
        vec3(0.0, 30.0, 5.0),
        #ffffff,
        60000.0
    )
)

add_light(
    spherical_light(
        vec3(0.0, 25.0, -18.0),
        #ffffff,
        60000.0
    )
)


ppm_write_image(width, height, ray_trace)

