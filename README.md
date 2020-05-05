# is thirteen

Check if a number is equal to 13. Inspired from this [Go Module](https://github.com/stanleynguyen/is-thirteen).

## Installation

- Via VPM
  - `v install is-thirteen`

- Via Vpkg
   - `vpkg install is-thirteen`

## Usage

```v
import is-thirteen as is

fn main() {
	is-thirteen.number(13).thirteen()               // true
	is-thirteen.number(12.8).roughly.thirteen()     // true
	is-thirteen.number(6).within(10).of.thirteen()  // true

	// Check your math skillz
	is-thirteen.number(4).plus(5).thirteen()     // false
	is-thirteen.number(12).plus(1).thirteen()    // true
	is-thirteen.number(4).minus(12).thirteen()   // false
	is-thirteen.number(14).minus(1).thirteen()   // true
	is-thirteen.number(1).times(8).thirteen()    // false
	is-thirteen.number(26).divides(2).thirteen() // true

	// Check your spelling and chemistry skillz
	is-thirteen.str("tHirTeEn").thirteen()  // true
	is-thirteen.str("neetriht").backwards.thirteen()  // true
	is-thirteen.str("aLumInUm").atomic_number.thirteen() // true
}
```

## License

Released under [MIT](LICENSE.md).
