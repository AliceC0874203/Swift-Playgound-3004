//
//  HourlyEmployee.swift
//  c0874203_PennaparSupawatrai_FT3004
//
//  Created by Alice’z Poy on 2022-10-06.
//

import Foundation

class HourlyEmployee: Employee {
    private var _hourlyRate: Double = 0.0
    private var _hoursWorked: Double = 0.0
    
    var hourlyRate: Double {
        get {
            return _hourlyRate
        }
        
        set {
            _hourlyRate = newValue
        }
    }
    
    var hoursWorked: Double {
        get {
            return _hoursWorked
        }
        
        set {
            _hoursWorked = newValue
        }
    }
    
    init(empID: String, fName: String, lName: String, hourlyRate: Double, hoursWorked: Double) {
        super.init(empID: empID, fName: fName, lName: lName)
        self._hourlyRate = hourlyRate
        self._hoursWorked = hoursWorked
        incomeWeekly = incomeWeekly()
    }

    override var description: String {
        let a = """
        HourlyEmployee Weeky income = \(incomeWeekly())\n
        """
        return super.description + a
    }
}

extension HourlyEmployee: Taxable {
    func incomeWeekly() -> Double {
        return (hourlyRate * hoursWorked) * Date.numberOfDaysInAWeek
    }
}
