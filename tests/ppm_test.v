import ppm {
	Canva,
	Color
}

fn test_get_canva_ppm_header(){
	c := Canva.new(10, 20)
	assert c.header() == "P3\n10 20\n255\n"
}

fn test_get_set_canva_color(){
	mut c := Canva.new(5, 3)
	red := Color.new(255, 0, 0)
	green := Color.new(0, 255, 0)
	blue := Color.new(0, 0, 255)

	c.set(0, 0, red)
	c.set(1, 2, green)
	c.set(2, 4, blue)

	assert c.get(0, 0) == red
	assert c.get(1, 2) == green
	assert c.get(2, 4) == blue
}

fn test_get_canva_ppm(){
	mut c := Canva.new(5, 3)
	red := Color.new(255, 0, 0)
	green := Color.new(0, 255, 0)
	blue := Color.new(0, 0, 255)

	c.set(0, 0, red)
	c.set(1, 2, green)
	c.set(2, 4, blue)
	assert c.to_ppm() == "P3\n5 3\n255\n255 000 000 000 000 000 000 000 000 000 000 000 000 000 000 \n000 000 000 000 000 000 000 255 000 000 000 000 000 000 000 \n000 000 000 000 000 000 000 000 000 000 000 000 000 000 255 \n"
}

fn test_split_long_line_ppm() {
	mut c := Canva.new(10, 2)
	color := Color.new(255, 204, 153)
	for row in 0..2 {
		for col in 0..10 {
			c.set(row, col, color)
		}
	}
	assert c.to_ppm() == "P3\n10 2\n255\n255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 \n153 255 204 153 255 204 153 255 204 153 255 204 153 \n255 204 153 255 204 153 255 204 153 255 204 153 255 204 153 255 204 \n153 255 204 153 255 204 153 255 204 153 255 204 153 \n"
}
