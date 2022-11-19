//
//  loginScreenViewModels.swift
//  CompanySoftwareApp
//
//  Created by Mehmet Biçici on 16.11.2022.
//

import Foundation

class AccessScreenViewModel {
    
    var company = Company(employee: [])
    
    func createData() {
        
        company.companyName = "Sigma Coding"
        company.incomeForCompany = 5900000
        company.yearOfFoundation = 1990
        company.employee = [Employee(employeeName: "Patrick Bateman", age: 27, marialStatus: .single, employeeTypes: .senior),Employee(employeeName: "Jordan Belfort", age: 25, marialStatus: .single, employeeTypes: .junior), Employee(employeeName: "Antonio Montana", age: 34, marialStatus: .married, employeeTypes: .senior), Employee(employeeName: "Tyler Durden", age: 30, marialStatus: .single, employeeTypes: .junior)]
    }
    
    func getData() -> Company {
        
        return company
        
        
    }
    
    func increaseIncome(income: String, value: Double) -> Double  {
        if var income = Double(income) {
            income = income + value
            return income
        }
        return 0
    }
    
    func decreaseIncome(income: String, value: Double) -> Double {
        if var income = Double(income) {
            income = income - value
            return income
        }
        return 0
    }
    
    func salaryPayment(company: Company,employeeName: String, income: String) -> Double {
        if var income = Double(income) {
            for name in company.employee {
                if name.employeeName == employeeName {
                    income = income - (name.salary ?? 0)
                    return income
                }
            }
        }
        return 0
    }
    
    func showEmployeeName(company: Company) -> String {
        var emptyStr = ""
        for nameEmployee in company.employee {
            emptyStr += "'" + nameEmployee.employeeName + "' "
        }
        return emptyStr
    }
    
    func getNewData(newCompany: Company) -> Company {
        return newCompany
    }
    
}
