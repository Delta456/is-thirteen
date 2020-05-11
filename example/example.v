import is_thirteen

fn main() {
	is_thirteen.number(13).thirteen()               // true
	is_thirteen.number(12.8).roughly.thirteen()     // true
	is_thirteen.number(6).within(10).of.thirteen()  // true

	// Check your math skillz
	is_thirteen.number(4).plus(5).thirteen()     // false
	is_thirteen.number(12).plus(1).thirteen()    // true
	is_thirteen.number(4).minus(12).thirteen()   // false
	is_thirteen.number(14).minus(1).thirteen()   // true
	is_thirteen.number(1).times(8).thirteen()    // false
	is_thirteen.number(26).divides(2).thirteen() // true

	// Check your spelling and chemistry skillz
	is_thirteen.str("tHirTeEn").thirteen()  // true
	is_thirteen.str("neetriht").backwards.thirteen()  // true
	is_thirteen.str("aLumInUm").atomic_number.thirteen() // true
}
