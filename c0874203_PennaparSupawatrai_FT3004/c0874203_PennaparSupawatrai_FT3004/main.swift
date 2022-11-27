//
//  main.swift
//  c0874203_PennaparSupawatrai_FT3004
//
//  Created by Alice’z Poy on 2022-10-06.
//

import Foundation

var employees = [Employee]()

employees.append(HourlyEmployee(empID: "1", fName: "A", lName: "A1", hourlyRate: 15, hoursWorked: 8))
employees.append(HourlyEmployee(empID: "2", fName: "B", lName: "B1", hourlyRate: 18, hoursWorked: 6))

employees.append(SalariedEmployee(empID: "3", fName: "C", lName: "C1", yearlySalary: 150000))
employees.append(SalariedEmployee(empID: "4", fName: "D", lName: "D1", yearlySalary: 300000))

employees.append(BasePlusCommissionEmployee(empID: "5", fName: "E", lName: "E1", weeklySalary: 300, weeklySales: 20, commissionRate: 1.5))
employees.append(BasePlusCommissionEmployee(empID: "6", fName: "F", lName: "F1", weeklySalary: 400, weeklySales: 30, commissionRate: 2.5))

if employees.count > 0 {
    print("-------------- Low income to High ----------------")
    employees = employees.sorted(by: {$0.incomeWeekly < $1.incomeWeekly})
    for employee in employees {
        print(employee)
    }
    print("--------------------------------------------------")

    print("------------- High income to Low -----------------")
    employees = employees.sorted(by: {$0.incomeWeekly > $1.incomeWeekly})
    for employee in employees {
        print(employee)
    }
    print("--------------------------------------------------")
}
