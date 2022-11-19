//
//  ViewController.swift
//  CompanySoftwareApp
//
//  Created by Mehmet Biçici on 16.11.2022.
//

import UIKit

class ViewController: UIViewController {
    var company = Company(employee: [Employee(employeeName: "mehmet", age: 25, marialStatus: .married, employeeTypes: .junior)], companyName: "sigma", incomeForCompany: 500, yearOfFoundation: 1920)
    override func viewDidLoad() {
        super.viewDidLoad()
        print(company.companyName ?? "")
    }

    
    
    
    
    
}

