module range

pub struct Range[T] {
	limit T
	step  T
mut:
	curr T
}

fn (mut t Range[T]) next[T]() ?T {
	if (t.step > 0 && t.curr >= t.limit) || (t.step < 0 && t.curr <= t.limit) {
		return none
	}
	res := t.curr
	t.curr += t.step
	return res
}

pub fn (mut t Range[T]) to_array[T]() []T {
	mut res := []T{}
	for v in t {
		res << v
	}
	return res
}

pub struct RangeOptions[T] {
	start T
	stop  T
	step  T
}

pub fn range[T](opts RangeOptions[T]) Range[T] {
	return Range[T]{
		limit: opts.stop
		step: opts.step
		curr: opts.start
	}
}
