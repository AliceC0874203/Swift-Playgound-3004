//
//  Q3.swift
//  c0874203_PennaparSupawatrai_lab1-2
//
//  Created by Alice’z Poy on 2022-10-03.
//

import Foundation

/**
 Question
 
 Part III – 45%
 Words count
 Write and test a function that takes a String as a parameter and returns the number of characters and number of words in this string.
 */

//Answer

func wordsCount(words: String) -> String {
    var countWord = 0
    
    if !words.isEmpty {
        let arrayWord = words.components(separatedBy: " ")
        
        for word in arrayWord {
            if !word.isEmpty {
                countWord += 1
            }
        }
    }
        
    return String(format: "Characters = %d and Words = %d", words.count, countWord)
}
