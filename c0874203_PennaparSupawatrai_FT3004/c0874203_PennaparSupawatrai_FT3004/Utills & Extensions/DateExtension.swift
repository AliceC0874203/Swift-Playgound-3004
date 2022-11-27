//
//  DateExtension.swift
//  c0874203_PennaparSupawatrai_FT3004
//
//  Created by Alice’z Poy on 2022-10-06.
//

import Foundation

extension Date {
    static let numberOfWeeksInCurrentYear = Double(Calendar.current.range(of: .weekOfYear, in: .yearForWeekOfYear, for: Self())?.count ?? 0)
    static let numberOfDaysInAWeek = 7.0
}
