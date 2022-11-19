//
//  AddEmployeeScreeenViewModel.swift
//  CompanySoftwareApp
//
//  Created by Mehmet Biçici on 18.11.2022.
//

import Foundation

class AddEmployeeScreenViewModel {
    var data = AccessScreenViewModel()
    static var addedData = Company(employee: [])
    
   
    
    func getDataForAdding() -> Company {
        if AddEmployeeScreenViewModel.addedData.companyName != nil  {
            let difData = AddEmployeeScreenViewModel.addedData
            return difData
        } else {
            data.createData()
            let difData = data.getData()
            return difData
        }
        return Company(employee: [])
    }
    
    func addNewEmployee(companyObject: Company,employeeList: Employee) -> Company {
        var placeHolderObject = companyObject
        let newEmployee = employeeList
        var newEmployeeList = placeHolderObject.employee
        newEmployeeList.append(newEmployee)
        placeHolderObject = Company(employee: newEmployeeList, companyName: placeHolderObject.companyName, incomeForCompany: placeHolderObject.incomeForCompany, yearOfFoundation: placeHolderObject.yearOfFoundation)
        print("Added New Employee: \((newEmployee.employeeName )) !!")
        print(" ")
        
        return placeHolderObject
    }
    
    func createNewData(newData: Company) {
        AddEmployeeScreenViewModel.addedData = newData
    }
    
    func getData() -> Company {
        return AddEmployeeScreenViewModel.addedData
    }
    
}
