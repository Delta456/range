module range

fn assert_arrays_are_equal[T](expected []T, actual []T) {
	assert expected.len == actual.len
	for i := 0; i < expected.len; i++ {
		assert expected[i] == actual[i], 'expected ${expected[i]} at index $[i] but got ${actual}'
	}
}

fn test_all_args_inc_to_arr() {
	start := 10
	stop := 20
	step := 2
	expected := [10, 12, 14, 16, 18]
	mut r := range(start: start, stop: stop, step: step)
	assert start == r.curr
	assert stop == r.limit
	assert step == r.step
	assert_arrays_are_equal(expected, r.to_array())
}

fn test_all_args_dec_to_arr() {
	start := 20.0
	stop := 10.0
	step := -2.0
	expected := [20.0, 18.0, 16.0, 14.0, 12.0]
	mut r := range(start: start, stop: stop, step: step)
	assert start == r.curr
	assert stop == r.limit
	assert step == r.step
	assert_arrays_are_equal(expected, r.to_array())
}

fn test_no_start_inc_to_arr() {
	stop := 10
	step := 2
	expected := [0, 2, 4, 6, 8]
	mut r := range(stop: stop, step: step)
	assert stop == r.limit
	assert step == r.step
	assert_arrays_are_equal(expected, r.to_array())
}

fn test_iterable() {
	start := 0.0
	step := 0.1
	stop := 1.0 + step
	mut expected := 0.0
	mut r := range(start: start, stop: stop, step: step)
	for actual in r {
		assert actual == expected
		expected += step
	}
}
