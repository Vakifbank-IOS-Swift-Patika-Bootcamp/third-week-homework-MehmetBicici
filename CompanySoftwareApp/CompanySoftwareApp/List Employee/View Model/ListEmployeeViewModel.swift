//
//  ListEmployeeViewModel.swift
//  CompanySoftwareApp
//
//  Created by Mehmet Biçici on 19.11.2022.
//

import Foundation

class ListEmployeeViewModel {
    
    func getData() -> [Employee] {
        return AddEmployeeScreenViewModel.addedData.employee
    }
}
