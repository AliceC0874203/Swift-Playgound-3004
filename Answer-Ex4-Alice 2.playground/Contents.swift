/**
 4. Collection Types
 Array
 Exercise 4.1
 Create an empty array with values of type Int and assign it to a variable in as many ways as you can think of (there's at least 4 ways).
 */
var a: [Int] = []
var b: Array<Int> = []
var c = [Int]()
var d = Array(repeating: Int(), count: 0)


/**
 Exercise 4.2
 Create an array containing the integer values 4, 8, 15, 16, 23, and 42. There are at least 4 ways to do this, as well.
 */
var a2: [Int] = [4, 8, 15, 16, 23, 42]
var b2: Array<Int> = [4, 8, 15, 16, 23, 42]
var c2 = [Int]([4, 8, 15, 16, 23, 42])
var d2 = Array([4, 8, 15, 16, 23, 42])

/**
 Exercise 4.3
 Create an array that cannot be modified containing the integer values 4, 8, 15, 16, 23, and 42.
 */
let array = [4, 8, 15, 16, 23, 42]
//array[0] = 5 //Error Cannot assign through subscript: 'array' is a 'let' constant

/**
 Exercise 4.4
 Add the values 1138, 1337, and 4711 to the end of the following array:
 var stuff = [4, 8, 15, 16, 23, 42]
 */
var stuff = [4, 8, 15, 16, 23, 42]
stuff.append(contentsOf: [1138, 1337, 4711])

/**
 Exercise 4.5
 Replace the value 15 with the value 17 in the following array:
 var numbers = [4, 8, 15, 16, 23, 42]
 */
var numbers = [4, 8, 15, 16, 23, 42]
numbers[2] = 17

/**
 Exercise 4.6
 Replace the values 15, 16, and 23 with the values 1, 2, 3, 4, and 5 in the following array:
 var numbers = [4, 8, 15, 16, 23, 42]
 */
var numbers1 = [4, 8, 15, 16, 23, 42]
numbers1[2...4] = [1, 2, 3, 4, 5]

/**
 Exercise 4.7
  Create an array containing 10 sheep "🐑" strings. Then print the length of the array.
 */
var sheeps = Array(repeating: "🐑", count: 10)
print(sheeps.count)

/**
 Exercise 4.8
 Write at least one variant of removing the last element in an array, where you don't know the length.
 */
var sheeps1 = Array(repeating: "🐑", count: 10)
sheeps1.removeLast()

/**
 Set
 Exercise 4.9
 Given the following sets:
 let houseAnimals: Set = ["🐶", "🐱"]
 let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
 let cityAnimals: Set = ["🐦", "🐭"]
 Use set operations to...
 1. ...determine whether the set of house animals is a subset of farm animals.
 2. ...determine whether the set of farm animals is a superset of house animals.
 3. ...determine if the set of farm animals is disjoint with city animals.
 4. ...create a set that only contains farm animals that are not also house animals.
 5. ...create a set that contains all the animals from all sets.
 */
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
//1
houseAnimals.isSubset(of: farmAnimals)
//2
farmAnimals.isSuperset(of: houseAnimals)
//3
farmAnimals.isDisjoint(with: cityAnimals)
//4
let onlyFarmAnimal = farmAnimals.subtracting(houseAnimals)
//5
let allAnimal = houseAnimals.union(farmAnimals).union(cityAnimals)

/**
 Dictionary
 Exercise 4.10
 Create an empty dictionary with keys of type String and values of type Int and assign it to a variable in as many ways as you can think of (there's at least 4 ways).
 */
var a3 = [String:Int]()
var b3 = Dictionary<String,Int>()
var c3: Dictionary<String,Int> = [:]
var d4: [String:Int] = [:]

/**
 Exercise 4.11
 Create a mutable dictionary named secretIdentities where the key value pairs are "Hulk" -> "Bruce Banner", "Batman" -> "Bruce Wayne", and "Superman" -> "Clark Kent".
 */
var secretIdentities = [
  "Hulk": "Bruce Banner",
  "Batman": "Bruce Wayne",
  "Superman": "Clark Kent"
]

/**
 Exercise 4.12
 Given the dictionary from exercise 4.11, print the secret identity of Batman. Spoiler: It's Bruce Wayne.
 */
print(secretIdentities["Batman"] ?? "")

/**
 Exercise 4.13
 Given the dictionary from exercise 4.11, replace the secret identity of the Hulk with "David Banner", which was the Hulk's civilian name on the TV show for some reason. I guess they were not fans of alliteration, but I digress.
 */
secretIdentities["Hulk"] = "David Banner"
print(secretIdentities["Hulk"] ?? "")

/**
 Exercise 4.14
 Given the dictionary from exercise 4.11, iterate (with a for loop) over all the secret identities and print both the values and the keys.
 */
for (key, value) in secretIdentities {
    print("key \(key) value \(value)")
}
