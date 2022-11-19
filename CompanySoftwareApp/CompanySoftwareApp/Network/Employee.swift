//
//  employee.swift
//  CompanySoftwareApp
//
//  Created by Mehmet Biçici on 16.11.2022.
//

import Foundation

struct Employee {
    
    var employeeName: String
    var age: Int?
    var marialStatus: MarialStatusEnum?
    var employeeTypes: EmployeeTypesEnum?
    var salary: Double? {
        if employeeTypes == .senior && age ?? 0 > 25 {
            return 25 * 2500
        } else if employeeTypes == .junior && age ?? 0 > 25 {
            return 25 * 1000
        } else if age ?? 0 < 25 && employeeTypes == .senior {
            return 25 * 3000
        }
        return 5 * 1000
    }
    
}

enum MarialStatusEnum {
    
    case married
    case single
    
    var status: String {
        switch self {
        case .married:
            return "married"
        case .single:
            return "single"
        }
    }
}

enum EmployeeTypesEnum {
    
    case junior
    case mid
    case senior
    
    var type: String {
        switch self {
        case .junior:
            return "junior"
        case .mid:
            return "mid"
        case .senior:
            return "senior"
        }
    }
}
