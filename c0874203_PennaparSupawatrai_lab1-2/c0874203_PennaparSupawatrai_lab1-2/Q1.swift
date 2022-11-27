//
//  Q1.swift
//  c0874203_PennaparSupawatrai_lab1-2
//
//  Created by Alice’z Poy on 2022-10-03.
//

import Foundation

/**
 Question
 
 Part I – 60%
 Fibonacci sequence
 Fibonacci sequence is a sequence of whole numbers (integers) so that each number is the sum
 of the two previous numbers.
 - Implement a function which takes an input from the user of type integer and prints out the
 sequence up to the given integer.
 - Give the first and second numbers as 0 and 1.
 For example: Fibonacci sequence for a given number 5 as the number of sequences will be:
 0,1,1,2,3,5,8
 formula of Fibonacci series is
 Fn = Fn-1 + Fn-2
 */

//Answer

private func fibonacciSequence(number: Int) -> Int {
    var n1 = 0
    var n2 = 1
    var result = 0
    
    for _ in 0..<number {
        result = n1
        n1 = n2
        n2 = result + n2
    }
    
    return n1
}

func showFibonacciSequenceFromNumber(number val: Int) {
    guard val > 0 else {
        print("The number should more than 0");
        return
    }
    for i in 0...val{
       let output = fibonacciSequence(number: i)
       print(output)
    }
}
