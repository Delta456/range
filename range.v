module range

struct Range[T] {
mut:
	limit T
	step  T
	curr  T
}

fn (mut t Range[T]) next[T]() ?T {
	if (t.step > 0 && t.curr >= t.limit) || (t.step < 0 && t.curr <= t.limit) {
		return none
	}
	res := t.curr
	t.curr += t.step
	return res
}

pub struct Builder[T] {
pub:
	from T
	to   T
	step T
}

pub fn (t Builder[T]) from(v T) Builder[T] {
	return Builder[T]{
		from: v
		to: t.to
		step: t.step
	}
}

pub fn (t Builder[T]) to(v T) Builder[T] {
	return Builder[T]{
		from: t.from
		to: v
		step: t.step
	}
}

pub fn (t Builder[T]) step(v T) Builder[T] {
	return Builder[T]{
		from: t.from
		to: t.to
		step: v
	}
}

pub fn (t Builder[T]) to_iterator() Range[T] {
	return Range[T]{
		limit: t.to
		step: t.step
		curr: t.from
	}
}

pub fn (t Builder[T]) to_array() []T {
	mut res := []T{}
	mut it := t.to_iterator()
	for v in it {
		res << v
	}
	return res
}

pub fn new[T]() Builder[T] {
	return Builder[T]{}
}

pub fn to_array[T](builder Builder[T]) []T {
	return builder.to_array()
}

pub fn to_iterator[T](builder Builder[T]) Range[T] {
	return builder.to_iterator()
}
