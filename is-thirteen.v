module is_thirteen

import math
//import time

struct NumMatcher {
pub:
	value       f64
	roughly     RoughlyMatcher
	not         InvertedMatcher
	divisible_by DivMatcher
	square_of    SqMatcher
	greater_than GreaterMatcher
	less_than    LessMatcher
	year_of_birth BirthMatcher
}

// number Instanitiate a matcher for number type
pub fn number(value f64) NumMatcher {
	return NumMatcher{
		value:       value,
		roughly:     RoughlyMatcher{value},
		not:         InvertedMatcher{value},
		divisible_by: DivMatcher{value},
		square_of:    SqMatcher{value},
		greater_than: GreaterMatcher{value},
		less_than:    LessMatcher{value},
		year_of_birth: BirthMatcher{value/*,RealClock{}*/},
	}
}

// thirteen Check if the number is Thirteen
pub fn (m NumMatcher) thirteen() bool {
	return m.value == thirteen
}

struct OfWithinMatcher {
pub:
	of WithinMatcher
}

// within instanitiate a matcher for number within a range around thirtheen
pub fn (m NumMatcher) within(number_range f64) OfWithinMatcher {
	return OfWithinMatcher{
		of: WithinMatcher{
			value:       m.value,
			num_range: number_range,
		},
	}
}

// plus instanitiate a number matcher with a new value with add
pub fn (m NumMatcher) plus(num f64) NumMatcher {
	return number(m.value + num)
}

// minus instanitiate a number matcher with a new value with a sub
pub fn (m NumMatcher) minus(num f64) NumMatcher {
	return number(m.value - num)
}

// times instanitiate a number matcher with a new value with a product
pub fn (m NumMatcher) times(num f64) NumMatcher {
	return number(m.value * num)
}

// divides Instanitiate a  matcher with a new value with a division
pub fn (m NumMatcher) divides(num f64) NumMatcher {
	return number(m.value / num)
}

struct StrMatcher {
	value        string
pub:    
	//anagram_of    AnagramMatcher
	can_spell     SpellMatcher
	backwards    BackwardsMatcher
	atomic_number AtomicMatcher
}

// str Instanitiate a matcher for string type
pub fn str(value string) StrMatcher {
	return StrMatcher{
		value:        value,
		can_spell:     SpellMatcher{value},
		//anagram_of:    AnagramMatcher{value},
		backwards:    BackwardsMatcher{value},
		atomic_number: AtomicMatcher{value},
	}
}

// thirteen check whether the string is 13 in base 10 or is one of thirteen_strs
pub fn (m StrMatcher) thirteen() bool {
		if m.value in thirteen_strs {
			return true
		}
    return m.value.int() == thirteen
}

// base instanitiate a number matcher with a new value of base b
pub fn (m StrMatcher) base(b int) NumMatcher {
    return number(f64(m.value.int()))
}

struct RoughlyMatcher {
	value f64
}

// thirteen check if the number is roughly Thirteen
pub fn (m RoughlyMatcher) thirteen() bool {
	return math.round(m.value) == thirteen
}

struct InvertedMatcher {
	value f64
}

// thirteen check if the number is not Thirteen
pub fn (m InvertedMatcher) thirteen() bool {
	return m.value != thirteen
}

struct DivMatcher {
	value f64
}

// thirteen check if the number is divisible by Thirteen
pub fn (m DivMatcher) thirteen() bool {
	return math.fmod(m.value, 13) == 0
}

struct SqMatcher {
	value f64
}

// thirteen check if the number is square of thirteen
pub fn (m SqMatcher) thirteen() bool {
	return m.value == thirteen*thirteen
}

struct GreaterMatcher {
	value f64
}

// thirteen check if the number is greater than thirteen
pub fn (m GreaterMatcher) thirteen() bool {
	return m.value > thirteen
}

struct LessMatcher{
	value f64
}

// thirteen check if the number is less than thirteen
pub fn (m LessMatcher) thirteen() bool {
	return m.value < thirteen
}

struct WithinMatcher {
	value       f64
	num_range f64
}

// thirteen check if the number is within a range of Thirteen
pub fn (m WithinMatcher) thirteen() bool {
	return m.value > (thirteen-m.num_range) && m.value < (thirteen+m.num_range)
}

struct BirthMatcher  {
	value f64
	//real RealClock
}
/*
struct RealClock{}

fn (RealClock) now() time.Time { return time.Now() }

// Thirteen Check if person with this year of birth is Thirteen year-old
fn (m BirthMatcher) thirteen() bool {
    return m.value-f64(time.now().year()) == 13
}
*/
struct SpellMatcher {
	value string
}


// thirteen check if a string has enough character to spells Thirteen
pub fn (m SpellMatcher) thirteen() bool {
    return has_chars(m.value, {"t": 2, "h": 1, "i": 1, "r": 1, "e": 2, "n": 1})
}

/*
struct AnagramMatcher{
	value string
}

pub fn (m AnagramMatcher) is_anagram(str string) bool {
    if m.value.len != str.len {
        return false
    }
    return m.value.bytes() == str.bytes()
}

fn sort_byte(arr mut []byte) {
    for j := 0; j < arr.len - 1; j++ { 
            for  i := j + 1; i < n; i++ { 
                if arr[j] > arr[i] { 
                    arr[j], arr[i] = arr[i], arr[j]        
                }
            }
}


// thirteen Check if a string is an anagram of Thirteen
pub fn (m AngramMatcher) thirteen() bool {
	return anagram.AreAnagram(strings.ToLower(m.value), "thirteen")
}
*/

struct BackwardsMatcher {
	value string
}

// thirteen check if a string is thirteen spelled backwards
pub fn (m BackwardsMatcher) thirteen() bool {
    return m.value.to_lower().reverse() == "thirteen"
}

struct AtomicMatcher {
	value string
}

// thirteen check if the string can spell Aluminum - the 13th chemical element
pub fn (m AtomicMatcher) thirteen() bool {
	return has_chars(m.value, {"a": 1,"l": 1,"u": 2,"m": 2,"i": 1,"n": 1})
}

fn has_chars(s string, occurr_count map[string]int) bool {
	for ch, count in occurr_count {
        if s.to_lower().count(ch) < count {
			return false
		}
	}
	return true
}
