//
//  Q4.swift
//  c0874203_PennaparSupawatrai_lab1-2
//
//  Created by Alice’z Poy on 2022-10-03.
//

import Foundation

/**
 Question
 Part IV – 55%
 Diamond Shape
 Write a program that takes an integer (in a variable) and displays, using asterisks, a filled diamond
 of the given side length. For example, if the side length is four, the program should display.
   *
  ***
 *****
*******
 *****
  ***
   *
 
 */

//Answer
func diamondShapeFromNumber(number n: Int) {
    guard n > 0 else {
        print("The number should more than 0 to see diamond");
        return
    }
    
    //Upside
    for i in 1...n {
        print(String(repeating: " ", count: n-i) + String(repeating: "*", count: 2*i - 1))
    }
    
    //Downside
    var i = n-1
    while i >= 1
    {
        print(String(repeating: " ", count: n-i) + String(repeating: "*", count: 2*i - 1))
        i = i-1
    }
}
