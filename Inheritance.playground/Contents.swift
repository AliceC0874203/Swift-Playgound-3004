//: # Inheritance
import UIKit
//: ### A class can inherit methods, properties, and other characteristics from another class
//: ### the inheriting class is known as a subclass, and the class it inherits from is known as its superclass
//: ## Defining a Base Class
//: ### Any class that does not inherit from another class is known as a base class.
//: ### Example:
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
        print("unknown noise")
    }
}
//: ### initializer syntax -> type name followed by empty parentheses:
let someVehicle = Vehicle()
//: ### access its description property
print("Vehicle: \(someVehicle.description)")
// Vehicle: traveling at 0.0 miles per hour
//: ## Subclassing
//: ### The subclass inherits characteristics from the existing class, which you can then refine. You can also add new characteristics to the subclass.
/*: ### To indicate that a subclass has a superclass, write the subclass name before the superclass name, separated by a colon:

 class SomeSubclass: SomeSuperclass {
 
 // subclass definition goes here

 }
*/
class Bicycle: Vehicle {
    var hasBasket = false
    override func makeNoise() {
        print("bike")
    }
}
//: * In addition to the characteristics it inherits, the Bicycle class defines a new stored property, hasBasket, with a default value of false
//: changing the value of hasBasket property in a subclass:
let bicycle = Bicycle()
bicycle.hasBasket = true
//: ### modify the inherited currentSpeed property of a Bicycle instance
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")
// Bicycle: traveling at 15.0 miles per hour
//: ## Subclasses can themselves be subclassed
//: ### two-seater bicycle known as a “tandem”:
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
    override func makeNoise() {
        print("Tandem")
    }
}
//: ### Tandem inherits all of the properties and methods from Bicycle, which in turn inherits all of the properties and methods from Vehicle.
//: ### you can work with any of its new and inherited properties
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")
// Tandem: traveling at 22.0 miles per hour
//: ## Overriding
//: A subclass can provide its own custom implementation of the properties and methods inherited from a superclass
//: ### you should use the override keyword to override the inherited characteristic
//: ### any overrides without the override keyword are diagnosed as an error when your code is compiled
//: ## you can access the superclass version of a method, property, or subscript by using the super prefix:
/*:
 ### super prefix:
 * An overridden method named someMethod() can call the superclass version of someMethod() by calling super.someMethod() within the overriding method implementation.
 * An overridden property called someProperty can access the superclass version of someProperty as super.someProperty within the overriding getter or setter implementation.
 * An overridden subscript for someIndex can access the superclass version of the same subscript as super[someIndex] from within the overriding subscript implementation.
*/
//: ## Overriding Methods
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
//: ### If you create a new instance of Train and call its makeNoise() method, you can see that the Train subclass version of the method is called: -> polymorphism
let train = Train()
train.makeNoise()
// Prints "Choo Choo"
//: ## Overriding Properties
//: ### Overriding Property Getters and Setters
//: * You can present an inherited read-only property as a read-write property by providing both a getter and a setter in your subclass property override
//: * You cannot, however, present an inherited read-write property as a read-only property.
//: Example:
class Car: Vehicle {
    final var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
    override func makeNoise() {
        print("Car ...")
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
// Car: traveling at 25.0 miles per hour in gear 3

//: ### Overriding Property Observers
//: ### You can use property overriding to add property observers to an inherited property.
//: ### This enables you to be notified when the value of an inherited property changes, regardless of how that property was originally implemented.
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
    override func makeNoise() {
        print("AC - no noise")
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
// AutomaticCar: traveling at 35.0 miles per hour in gear 4

class Plane: Vehicle {
    var wings = 2
}
let plane = Plane()

let vehicles: [Vehicle] = [someVehicle, bicycle, tandem, car, train, automatic, plane]
for vehicle in vehicles {
    vehicle.makeNoise()
}

//: ## Preventing Overrides
//: ### You can prevent a method, property, or subscript from being overridden by marking it as final.
//: ### final var, final func, final class func, and final subscript
//: ### You can mark an entire class as final by writing the final modifier before the class keyword in its class definition (final class)
//: ### Any attempt to subclass a final class is reported as a compile-time error.
