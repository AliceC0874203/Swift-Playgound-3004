//
//  Q2.swift
//  c0874203_PennaparSupawatrai_lab1-2
//
//  Created by Alice’z Poy on 2022-10-03.
//

import Foundation

/**
 Question
 
 Part II – 40%
 BMI Calculator
 The body mass index (BMI) is a measure used to quantify a person’s mass as well as interpret
 their body composition. It is defined as the mass (Kg) divided by height (m) squared.
 - make a function that takes the person’s weight and height as input parameters and returns
 the BMI
 - call the function with some test values and print the outcome to the console.
 Hint: Here is the BMI calculation formula:
 𝐵𝑀𝐼 = 𝑚𝑎𝑠𝑠 / ℎ𝑒𝑖𝑔ℎ𝑡 * ℎ𝑒𝑖𝑔ℎ𝑡
 */

//Answer

func BMICal(weightKG weight: Double, heightM height: Double) -> Double {
    guard weight > 0 || height > 0 else { return 0 }
    return weight / pow(height, 2)
}
