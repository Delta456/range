import range

// TODO: add more tests

fn test_range() {
	range.int(stop:10) == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
	range.int(start:1, stop:10) == [1, 2, 3, 4, 5, 6, 7, 8, 9]
	range.int(start:1, stop:10, step:2) == [1, 3, 5, 7, 9]
}
