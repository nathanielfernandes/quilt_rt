

fn ppm_write_header(width, height) {
    @print("P3
" .. width .. " " .. height .. "
    255
")
}

fn ppm_write_pixel(color) {
    @print(color[0] .. " " .. color[1] .. " " .. color[2] .. "
")
}

fn ppm_write_image(width, height, f) {
    // ppm_write_header(width, height)
    // for y in 0:height {
    //     for x in 0:width {
    //         ppm_write_pixel(f(x, y))
    //     }
    // }
}