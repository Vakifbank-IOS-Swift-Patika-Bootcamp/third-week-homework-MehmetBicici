//
//  AddEmployeeScreenViewController.swift
//  CompanySoftwareApp
//
//  Created by Mehmet Biçici on 18.11.2022.
//

import UIKit

class AddEmployeeScreenViewController: UIViewController {

    @IBOutlet private weak var navigationBar: UINavigationBar!
    @IBOutlet private weak var staticNameLabel: UILabel!
    @IBOutlet private weak var staticAgeLabel: UILabel!
    @IBOutlet private weak var staticMarialStatusLabel: UILabel!
    @IBOutlet private weak var staticEmployeeTypeLabel: UILabel!
    @IBOutlet private weak var staticSalaryLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var ageTextField: UITextField!
    @IBOutlet private weak var marialStatusTextField: UITextField!
    @IBOutlet private weak var employeeTypeTextField: UITextField!
    @IBOutlet private weak var salaryLabel: UILabel!
    @IBOutlet private weak var addEmployeeButton: UIButton!
    
    private let viewModel = AddEmployeeScreenViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        staticNameLabel.text = "Name"
        staticNameLabel.font = staticNameLabel.font.withSize(15)
        staticAgeLabel.text = "Age"
        staticAgeLabel.font = staticAgeLabel.font.withSize(15)
        staticSalaryLabel.text = "Salary"
        staticSalaryLabel.font = staticSalaryLabel.font.withSize(15)
        staticEmployeeTypeLabel.text = "Employee Type"
        staticEmployeeTypeLabel.font = staticEmployeeTypeLabel.font.withSize(15)
        staticMarialStatusLabel.text = "Marial Status"
        staticMarialStatusLabel.font = staticMarialStatusLabel.font.withSize(15)
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(named: "backButton.png"), for: .normal)
        backbutton.setTitle("Back", for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal)
        backbutton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        navigationBar.topItem?.title = "Add Employee"
        
        addEmployeeButton.setTitle("Add Employee", for: .normal)
        addEmployeeButton.backgroundColor = .systemBlue
        addEmployeeButton.setTitleColor(.white, for: .normal)
        addEmployeeButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        
        salaryLabel.text = "Add user for salary calculation!!"
    }

    @objc func backTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addEmpolyeeButtonTapped(_ sender: Any) {
        var data = viewModel.getDataForAdding()
        if marialStatusTextField.text == MarialStatusEnum.married.status && employeeTypeTextField.text == EmployeeTypesEnum.junior.type {
            data = viewModel.addNewEmployee(companyObject: data, employeeList: Employee(employeeName: nameTextField.text ?? "Empty", age: Int(ageTextField.text ?? "0") , marialStatus: .married  , employeeTypes: .junior ))
            viewModel.createNewData(newData: data)
            AddEmployeeScreenViewModel.addedData = data
            salaryLabel.text = String(AddEmployeeScreenViewModel.addedData.employee[AddEmployeeScreenViewModel.addedData.employee.count - 1].salary ?? 0)
        } else if marialStatusTextField.text == MarialStatusEnum.married.status && employeeTypeTextField.text == EmployeeTypesEnum.mid.type {
            data = viewModel.addNewEmployee(companyObject: data, employeeList: Employee(employeeName: nameTextField.text ?? "Empty", age: Int(ageTextField.text ?? "0") , marialStatus: .married  , employeeTypes: .junior ))
            viewModel.createNewData(newData: data)
            AddEmployeeScreenViewModel.addedData = data
            salaryLabel.text = String(AddEmployeeScreenViewModel.addedData.employee[AddEmployeeScreenViewModel.addedData.employee.count - 1].salary ?? 0)
        } else if marialStatusTextField.text == MarialStatusEnum.married.status && employeeTypeTextField.text == EmployeeTypesEnum.senior.type {
            data = viewModel.addNewEmployee(companyObject: data, employeeList: Employee(employeeName: nameTextField.text ?? "Empty", age: Int(ageTextField.text ?? "0") , marialStatus: .married  , employeeTypes: .junior ))
            viewModel.createNewData(newData: data)
            AddEmployeeScreenViewModel.addedData = data
            salaryLabel.text = String(AddEmployeeScreenViewModel.addedData.employee[AddEmployeeScreenViewModel.addedData.employee.count - 1].salary ?? 0)
        } else if marialStatusTextField.text == MarialStatusEnum.single.status && employeeTypeTextField.text == EmployeeTypesEnum.junior.type {
            data = viewModel.addNewEmployee(companyObject: data, employeeList: Employee(employeeName: nameTextField.text ?? "Empty", age: Int(ageTextField.text ?? "0") , marialStatus: .married  , employeeTypes: .junior ))
            viewModel.createNewData(newData: data)
            AddEmployeeScreenViewModel.addedData = data
            salaryLabel.text = String(AddEmployeeScreenViewModel.addedData.employee[AddEmployeeScreenViewModel.addedData.employee.count - 1].salary ?? 0)
        } else if marialStatusTextField.text == MarialStatusEnum.single.status && employeeTypeTextField.text == EmployeeTypesEnum.mid.type {
            data = viewModel.addNewEmployee(companyObject: data, employeeList: Employee(employeeName: nameTextField.text ?? "Empty", age: Int(ageTextField.text ?? "0") , marialStatus: .married  , employeeTypes: .junior ))
            viewModel.createNewData(newData: data)
            AddEmployeeScreenViewModel.addedData = data
            salaryLabel.text = String(AddEmployeeScreenViewModel.addedData.employee[AddEmployeeScreenViewModel.addedData.employee.count - 1].salary ?? 0)
        } else if marialStatusTextField.text == MarialStatusEnum.single.status && employeeTypeTextField.text == EmployeeTypesEnum.senior.type {
            data = viewModel.addNewEmployee(companyObject: data, employeeList: Employee(employeeName: nameTextField.text ?? "Empty", age: Int(ageTextField.text ?? "0") , marialStatus: .married  , employeeTypes: .junior ))
            viewModel.createNewData(newData: data)
            AddEmployeeScreenViewModel.addedData = data
            salaryLabel.text = String(AddEmployeeScreenViewModel.addedData.employee[AddEmployeeScreenViewModel.addedData.employee.count - 1].salary ?? 0)
        } else {
            salaryLabel.text = "ERROR!At least one of the values entered is incorrect"
        }
        
        
    }
    
}
