# range

Numeric ranges in V.

## Why

- `a..b` in V can only be in increasing order and not in negative order.
- Lacks inbuilt `step` which most people need or want.
- No support for `float` type.
- Solution for [vlang/v#5944](https://github.com/vlang/v/issues/5944).

## Features

- Make `range` easily
- Make ranges for `int` and `f32`
- Positive as well as negative support!
- No need to write the whole for loop! (*this maybe slower than the normal one*)
- Use `range` for functional programming
- Support iterators. Long ranges without high memory allocation.
- Half open-open ranges `[from,to]`

## Installation

- Via `git clone`
    - `git clone https://github.com/Delta456/range`
- Via `v install`
    - `v install range`
- Via `vpkg`
    - `vpkg install range`

## Usage

Use an iterator if you need a large range but don't want to allocate space in memory for all numbers in the range.

```v
import delta456.range

mut iter := range.to_iterator(from: 0, to: 1000000, step: 2)
for v in iter {
  println(v)
}
```

```
$ v run main.v
0
2
4
```

Use an array when you need it and the memory allocation for all values in the range is not a problem.

```v
import delta456.range

arr := range.to_array(from: 10, to: 0, step: -1)
println(arr)
```

```
v run main.v
[10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
```

If you prefer you can use the builder syntax.

```v
mut iter := range.new[int]().from(0).to(10).step(1).to_iterator()insinstall/

// or

arr := range.new[int]().from(0).to(10).step(1).to_array()

// or

mut iter := range.Builder[int]{ from: 0, to: 10, step: 1 }.to_iterator()

// or

arr := range.Builder[int]{ from: 0, to: 10, step: 1 }.to_array()
```

The builder is immutable! You can reuse it as many times as you want.

```v
zero_to_nine := range.new[int]().from(0).to(10).step(1)

// print from 0 to 9
for v in zero_to_nine.to_iterator() {
  println(v)
}

// print from 0 to 9 again, no problems
for v in zero_to_nine.to_iterator() {
  println(v)
}
```

## License

Released under [MIT](LICENSE)
