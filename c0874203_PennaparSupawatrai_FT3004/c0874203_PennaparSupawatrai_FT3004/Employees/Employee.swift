//
//  Employee.swift
//  c0874203_PennaparSupawatrai_FT3004
//
//  Created by Alice’z Poy on 2022-10-06.
//

import Foundation

class Employee {
    
    private var _incomeWeekly: Double = 0.0
    private var _empID: String = ""
    private var _fName: String = ""
    private var _lName: String = ""
    
    var empID: String {
        get {
            return _empID
        }
        
        set {
            _empID = newValue
        }
    }
    
    var fName: String {
        get {
            return _fName
        }
        
        set {
            _fName = newValue
        }
    }
    
    var lName: String {
        get {
            return _lName
        }
        
        set {
            _lName = newValue
        }
    }
    
    var incomeWeekly: Double {
        get {
            return _incomeWeekly
        }
        
        set {
            _incomeWeekly = newValue
        }
    }
    
    init(empID: String, fName: String, lName: String) {
        self._empID = empID
        self._fName = fName
        self._lName = lName
    }
}

extension Employee: CustomStringConvertible {
    @objc var description: String {
        let a = """
        Employee ID = \(empID)
        First Name = \(fName)
        Last Name = \(lName)\n
        """
        return a
    }
}
