//: # Lesson 5 Exercises solution - Defining and Calling Functions

import UIKit

//: __Problem 1.__

var word = "bologna"

// Solution
var lastLetter = word.remove(at: word.index(before: word.endIndex))

//: __Problem 2__

var nonsenseArray = ["bungalow", "buffalo", "indigo", "although", "Ontario", "albino", "%$&#!"]

// Solution
func combineLastCharacters(_ wordArray:[String]) -> String {
    var newWord = ""
    for var word in wordArray {
        let lastCharacter = word.remove(at: word.index(before: word.endIndex))
        newWord.append(lastCharacter)
    }
    return newWord
}

combineLastCharacters(nonsenseArray)

//: __Problem 3__

let digits = CharacterSet.decimalDigits
// Solution

func digitsOnly(_ word: String) -> Bool {
    for character in word.unicodeScalars {
        if !digits.contains(character) {
            return false
        }
    }
    return true
}
// another solution
func digitsOnly2(_ word: String) -> Bool {
    for index in 0 ..< word.count {
        if !digits.contains(word.unicodeScalars[word.index(word.startIndex, offsetBy: index)]) {
            return false
        }
    }
    return true
}
let x = digitsOnly2("589h")
print(x)

//: __Problem 4__

let dirtyWordsArray = ["phooey", "darn", "drat", "blurgh", "jupiters", "argh", "fudge"]

// Solution
func cleanUp(_ dirtyArray: [String]) -> [String] {
    var cleanArray = [String]()
    for word in dirtyArray {
        if word.count == 4 {
        } else {
            cleanArray.append(word)
        }
    }
    return cleanArray
}

cleanUp(dirtyWordsArray)

//: __Problem 5__

var movies:Dictionary<String,String> = [ "Boyhood":"Richard Linklater","Inception":"Christopher Nolan", "The Hurt Locker":"Kathryn Bigelow", "Selma":"Ava Du Vernay", "Interstellar":"Christopher Nolan"]
// Solution
class MovieArchive {
    func filterByDirector(_ currentDirector:String, movies: Dictionary<String, String>) -> [String] {
        var filteredArray = [String]()
        for (movie, director) in movies {
            if director == currentDirector {
                filteredArray.append(movie)
            }
        }
        return filteredArray
    }
}


var myArchive = MovieArchive()
myArchive.filterByDirector("Richard Linklater", movies: movies)

