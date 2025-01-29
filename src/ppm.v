module ppm

import gx
import os

pub type Color = gx.Color

const empty_str = ""
const new_line = "\n"

pub struct Canva {
	mut:
		pixels [][] Color
	pub:
		width int
		height int
}

pub fn Color.new(red u8, green u8, blue u8) Color {
	return Color(gx.Color{
		r: red
		g: green
		b: blue
	})
}

pub fn Canva.new(width int, height int) Canva {
	return Canva{
		pixels : [][]Color{len: height, init: []Color{len: width, init:  Color.new(0, 0, 0)}}
		width: width
		height: height
	}
}

pub fn (self Canva) header() string {
	mut buffer := "P3\n"
	buffer += "${self.width} ${self.height}\n"
	buffer += "255\n"
	return buffer
}

pub fn (self Canva) get(row int, col int) Color {
	return self.pixels[row][col]
}

pub fn (mut self Canva) set(row int, column int, color Color) bool {
	if row >= self.height || row < 0 {
		return false
	}
	if column >= self.width || column < 0 {
		return false
	}
	self.pixels[row][column] = color
	return true
}

pub fn (self Canva) to_ppm() string {
	mut canva_buffer := empty_str
	mut row_buffer := empty_str
	for row in 0..self.height {
		row_buffer = empty_str
		for col in 0..self.width {
			color := self.get(row, col)
			row_buffer, canva_buffer = add_color_to_buffer(row_buffer, canva_buffer, color)
		}
		canva_buffer += row_buffer + new_line
	}
	return self.header() + canva_buffer
}

pub fn (self Canva) save(file_path string) {
	mut f := os.create(file_path) or {panic("Cannot open ppm file : '${file_path}'")}
    defer {
        f.close()
    }
	f.writeln(self.to_ppm()) or {panic("Cannot write to ppm file : '${file_path}'")}
}

fn add_color_to_buffer(row_buffer string, canva_buffer string, color Color) (string, string) {
	mut new_row_buffer := row_buffer
	mut new_self_buffer := canva_buffer

	color_channels := [color.r, color.g, color.b]

	for color_channel in color_channels {
		new_row_buffer += "${color_channel:03} "
		if new_row_buffer.len >= 68 {
			new_self_buffer += "${new_row_buffer}\n"
			new_row_buffer = empty_str
		}
	}

	return new_row_buffer, new_self_buffer
}
