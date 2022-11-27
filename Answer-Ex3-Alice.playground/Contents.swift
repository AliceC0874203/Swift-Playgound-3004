/**
 3. Strings and Characters
 Exercise 3.1
 Create the string "Detroit Red Wings" from the following variables/constants and assign it to the constant hockeyTeam:
 let city: String = "Detroit"
 var color = "Red"
 let wings = "Wings"
 First do it using concatenation and then again using interpolation.
 */
let city: String = "Detroit"
var color = "Red"
let wings = "Wings"

let hockeyTeam1 = city + " " + color + " " + wings //concatenation
let hockeyTeam2 = "\(city) \(color) \(wings)" //interpolation


 /**
 Exercise 3.2
 Assign the length of the string "4, 8, 15, 16, 23, 42" to the variable length.
  */
var length = "4, 8, 15, 16, 23, 42".count //20


  /**
 Exercise 3.3
 The book states that you can modify/mutate a string by making it a variable and not a constant, as follows:
 var variableString = "Detroit"
 variableString += " Red Wings"
 How does this work with regards to strings being value types?
 */
var variableString = "Detroit"
variableString += " Red Wings" //Detroit Red Wings
// same as concatenation
// variableString = variableString + " Red Wings"
