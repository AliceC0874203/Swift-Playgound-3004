//
//  SalariedEmployee.swift
//  c0874203_PennaparSupawatrai_FT3004
//
//  Created by Alice’z Poy on 2022-10-06.
//

import Foundation

class SalariedEmployee: Employee {
    private var _yearlySalary: Double = 0.0
    
    var yearlySalary: Double {
        get {
            return _yearlySalary
        }
        
        set {
            _yearlySalary = newValue
        }
    }
    
    init(empID: String, fName: String, lName: String, yearlySalary: Double) {
        super.init(empID: empID, fName: fName, lName: lName)
        self._yearlySalary = yearlySalary
        incomeWeekly = incomeWeekly()
    }
    
    override var description: String {
        let a = """
        SalariedEmployee Weeky income = \(incomeWeekly())\n
        """
        return super.description + a
    }
}

extension SalariedEmployee: Taxable {
    func incomeWeekly() -> Double {
        return yearlySalary/Date.numberOfWeeksInCurrentYear
    }
}
