//: # Initialization
import UIKit

//: ### Initialization is the process of preparing an instance of a class, structure, or enumeration for use.
//: ### Instances of class types can also implement a deinitializer, which performs any custom cleanup just before an instance of that class is deallocated.
//: ## Setting Initial Values for Stored Properties
//: Classes and structures must set all of their stored properties to an appropriate initial value by the time an instance of that class or structure is created.
//: ### Initializers
/*:
 ### init keyword:
 init() {
 
 // perform some initialization here
 
 }
*/
//: Example:
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")
// Prints "The default temperature is 32.0° Fahrenheit"
//: ### Default Property Values
struct Fahrenheit2 {
    var temperature = 32.0
}
//: ## Customizing Initialization
//: ### Initialization Parameters
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0
//: ### initializers are like functions, they have Parameter Names and Argument Labels but they don't have the func keyword
//: Example:
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
//: ### Initializer Parameters Without Argument Labels
struct Celsius2 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius2(37.0)
// bodyTemperature.temperatureInCelsius is 37.0

//: ## Optional Property Types
//: ### If your custom type has a stored property that is logically allowed to have “no value” perhaps because its value cannot be set during initialization, or because it is allowed to have “no value” at some later point, declare the property with an optional type.
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// Prints "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese."

//: ## Assigning Constant Properties During Initialization
//: ### You can assign a value to a constant property at any point during initialization
//: ### Once a constant property is assigned a value, it can’t be further modified.
//:### For class instances, a constant property can be modified during initialization only by the class that introduces it. It cannot be modified by a subclass.
//: ## Default Initializers
//: ### Swift provides a default initializer for any structure or class that provides default values for all of its properties and does not provide at least one initializer itself.
class ShoppingListItem1 {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem1()
//: ## Memberwise Initializers for Structure Types
//: ### Structure types automatically receive a memberwise initializer if they do not define any of their own custom initializers.
struct Size1 {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size1(width: 2.0, height: 2.0)

//: ## Initializer Delegation for Value Types
//: ### Initializers can call other initializers to perform part of an instance’s initialization. This process, known as initializer delegation, avoids duplicating code across multiple initializers.
//: ### Note that if you define a custom initializer for a value type, you will no longer have access to the default initializer (or the memberwise initializer, if it is a structure) for that type.
//: Example:
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
//: * init() {} -> Calling this initializer returns a Rect instance whose origin and size properties are both initialized with the default values of Point(x: 0.0, y: 0.0)
let basicRect = Rect()
// basicRect's origin is (0.0, 0.0) and its size is (0.0, 0.0)

//: * init(origin: Point, size: Size) -> the same as the memberwise initializer that the structure would have received if it did not have its own custom initializers
let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
                      size: Size(width: 5.0, height: 5.0))
// originRect's origin is (2.0, 2.0) and its size is (5.0, 5.0)

//: * the third initializer calls (or delegates) to the init(origin:size:) initializer, which stores the new origin and size values in the appropriate properties:
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)

//: ## Class Inheritance and Initialization
//: ### All of a class’s stored properties—including any properties the class inherits from its superclass—must be assigned an initial value during initialization.
//: ## Designated Initializers and Convenience Initializers
//: * Designated Initializers
//: ### Designated initializers are the primary initializers for a class. A designated initializer fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain.
//: ### Every class must have at least one designated initializer. In some cases, this requirement is satisfied by inheriting one or more designated initializers from a superclass
//: * Convenience Initializers
//: ### Convenience initializers are secondary, supporting initializers for a class
//: ### You do not have to provide convenience initializers if your class does not require them.
//: ## Syntax for Designated and Convenience Initializers
/*:
 ### Designated Initializers
 
 init(parameters) {
 
 statements
 
 }
*/
/*:
 ### Convenience Initializers
 
 convenience init(parameters) {
 
 statements
 
 }
*/
//: ## Initializer Delegation for Class Types
/*:
 ### the relationships between designated and convenience initializers
 * **RULE 1** A designated initializer must call a designated initializer from its immediate superclass.
 * **RULE 2** A convenience initializer must call another initializer from the *same* class.
 * **RULE 3** A convenience initializer must ultimately call a designated initializer.
*/
/*:
 ### A simple way to remember this is:
 * Designated initializers must always delegate up.
 * Convenience initializers must always delegate across.
*/
/*:
 ### These rules are illustrated in the figure below:
 
 ![](3Rules.png)

 */
//: ## Initializer Inheritance and Overriding
//: ### Swift subclasses do not inherit their superclass initializers by default.
//:### Superclass initializers are inherited in certain circumstances, but only when it is safe and appropriate to do so.
//: ### When you write a subclass initializer that matches a superclass designated initializer, you are effectively providing an override of that designated initializer.
//: ### Note: You always write the override modifier when overriding a superclass designated initializer, even if your subclass’s implementation of the initializer is a convenience initializer.
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")
// Vehicle: 0 wheel(s)

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")
// Bicycle: 2 wheel(s)

//: ## Automatic Initializer Inheritance
/*:
 ### Assuming that you provide default values for any new properties you introduce in a subclass, the following two rules apply:
 * **RULE 1** :
    * If your subclass doesn’t define any designated initializers, it automatically inherits all of its superclass designated initializers.
 * **RULE 2** :
    * If your subclass provides an implementation of all of its superclass designated initializers—either by inheriting them as per rule 1, or by providing a custom implementation as part of its definition—then it automatically inherits all of the superclass convenience initializers.
 ### These rules apply even if your subclass adds further convenience initializers.
 ### A subclass can implement a superclass designated initializer as a subclass convenience initializer as part of satisfying rule 2.
*/
//: Example:
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
//: ### The figure below shows the initializer chain for the Food class:
//: ![](Food.png)
//: remember that Classes do not have a default memberwise initializer
let namedMeat = Food(name: "Bacon")
// namedMeat's name is "Bacon"
let mysteryMeat = Food()
// mysteryMeat's name is "[Unnamed]"

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
//: ### The figure below shows the initializer chain for the RecipeIngredient class:
//: ### ![](Food2.png)
//: ### RecipeIngredient has provided an implementation of all of its superclass’s designated initializers
//: ### RecipeIngredient provides the init(name: String) initializer as a convenience initializer
//: ### according to RULE 2, RecipeIngredient automatically inherits all of its superclass’s convenience initializers too
//: ### All three of these initializers can be used to create new RecipeIngredient instances:
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}
/*:
 ### ShoppingListItem automatically inherits all of the designated and convenience initializers from its superclass
 * it provides a default value for all of the properties
 * it does not define any initializers itself
*/
//: ### The figure below shows the overall initializer chain for all three classes:
//: ![](Food3.png)
//: ### You can use all three of the inherited initializers to create a new ShoppingListItem instance:
var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}
// 1 x Orange juice ✔
// 1 x Bacon ✘
// 6 x Eggs ✘

//: ## Failable Initializers
//: ### failable initializer is written by placing a question mark after the init keyword (init?)
//: ### A failable initializer creates an optional value of the type it initializes
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
// someCreature is of type Animal?, not Animal

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
// Prints "An animal was initialized with a species of Giraffe"

let anonymousCreature = Animal(species: "")
// anonymousCreature is of type Animal?, not Animal

if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}
// Prints "The anonymous creature could not be initialized"

//: ## Required Initializers
//: ### required modifier indicate that every subclass of the class must implement that initializer:
class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}

//: ### required modifier must be written before every subclass implementation of a required initializer
class SomeSubclass: SomeClass {
    required init() {
        // subclass implementation of the required initializer goes here
    }
}




//mbkjjk

