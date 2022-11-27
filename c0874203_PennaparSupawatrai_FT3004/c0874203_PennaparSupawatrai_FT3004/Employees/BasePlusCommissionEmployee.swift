//
//  BasePlusCommissionEmployee.swift
//  c0874203_PennaparSupawatrai_FT3004
//
//  Created by Alice’z Poy on 2022-10-06.
//

import Foundation

class BasePlusCommissionEmployee: Employee {
    private var _weeklySalary: Double = 0.0
    private var _weeklySales: Double = 0.0
    private var _commissionRate: Double = 0.0
    
    var weeklySalary: Double {
        get {
            return _weeklySalary
        }
        
        set {
            _weeklySalary = newValue
        }
    }
    
    var weeklySales: Double {
        get {
            return _weeklySales
        }
        
        set {
            _weeklySales = newValue
        }
    }
    
    var commissionRate: Double {
        get {
            return _commissionRate
        }
        
        set {
            _commissionRate = newValue
        }
    }
    
    init(empID: String, fName: String, lName: String, weeklySalary: Double, weeklySales: Double, commissionRate: Double) {
        super.init(empID: empID, fName: fName, lName: lName)
        self._weeklySalary = weeklySalary
        self._weeklySales = weeklySales
        self._commissionRate = commissionRate
        incomeWeekly = incomeWeekly()
    }

    override var description: String {
        let a = """
        BasePlusCommissionEmployee Weeky income = \(incomeWeekly())\n
        """
        return super.description + a
    }
}

extension BasePlusCommissionEmployee: Taxable {
    func incomeWeekly() -> Double {
        return weeklySalary + (weeklySales * commissionRate)
    }
}
