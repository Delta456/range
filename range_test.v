module range

fn test_new_array_inc_int() {
	expected := [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
	actual := new[int]().from(0).to(10).step(1).array()
	assert actual == expected
}

fn test_struct_array_inc_u8() {
	expected := [u8(0), 2, 4, 6, 8]
	actual := Builder[u8]{
		from: 0
		to: 10
		step: 2
	}.array()
	assert actual == expected
}

fn test_new_iterator_dec_f32() {
	step := f32(0.1)
	mut curr := f32(1.0)
	iter := new[f32]().from(1.0).to(-step).step(-step).iterator()
	for actual in iter {
		assert actual == curr
		curr -= step
	}
}

fn test_struct_iterator_inc_f64() {
	step := 3.1415
	mut curr := 0.0
	iter := Builder[f64]{
		from: 0.0
		to: 10
		step: step
	}.iterator()
	for actual in iter {
		assert actual == curr
		curr += step
	}
}
