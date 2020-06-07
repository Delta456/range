module range

pub struct IntRange {
	start int = 0
	stop  int
	step  int = 1
}

pub struct FloatRange {
	start f32 = 1.0
	stop  f32
	step  f32 = 1.0
}

pub fn int(range IntRange) []int {
	mut arr := []int{}
	if range.step == 0 {
		eprintln('range: step cannot be zero')
		exit(1)
	}
	if range.start > range.stop {
		if range.step <= -1 {
			for i := range.start; i > range.stop; i += range.step {
				arr << i
			}
		}
	}
	for i := range.start; i < range.stop; i += range.step {
		arr << i
	}
	return arr
}

pub fn float(float FloatRange) []f32 {
	mut arr := []f32{}
	if float.step == 0 {
		eprintln('range: step cannot be zero')
		exit(1)
	}
	if float.start > float.stop {
		if float.step > 0 {
			eprintln('range: negative float step provided')
			exit(1)
		}
		for i := float.start; i > float.stop; i += float.step {
			arr << i
		}
	}
	for i := float.start; i < float.stop; i += float.step {
		arr << i
	}
	return arr
}
