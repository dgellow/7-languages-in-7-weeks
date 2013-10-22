// Day 1
//
//- Answers
//_________
// Evaluate 1 + 1 and then 1 + "one" . Is Io strongly typed or weakly
// typed? Support your answer with code.
1 + 1 // => 2
try(1 + "one") error 
// => argument 0 to method '+' must be a Number, not a 'Sequence'

// Conclusion: Io is strongly typed.

//_________
// Is 0 true or false? What about the empty string? Is nil true or false?
true and 0 // => true
true and nil // => false
true and "" // => true

// Conclusion: everything but nil and false is true.

//_________
// How can you tell what slots a prototype supports?
Object slotNames

// ::=    Creates slot, creates setter, assigns value
Alien := Object clone do (
  legs ::= nil // Compiles to newSlot("legs", "P...")
)
Zerg := Alien setLegs(6)

// :=     Creates slot, assigns value
Alien age := 255 // Compiles to Alien setSlot("age", 255)

// =      Assigns value to slot if it exists, otherwise raises an exception
Alien age = 123 // Compiles to Alien updateSlot("age", "Ba...")
try(Alien favoriteFood = "Banaaaaana") error
// => Slot favoriteFood not found. 
//    Must define slot using := operator before updating.
