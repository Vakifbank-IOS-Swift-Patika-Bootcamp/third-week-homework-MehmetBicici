//
//  AccessScreenViewController.swift
//  CompanySoftwareApp
//
//  Created by Mehmet Biçici on 16.11.2022.
//

import UIKit

class AccessScreenViewController: UIViewController {
    
    @IBOutlet private weak var staticCompanyNameLabel: UILabel!
    @IBOutlet private weak var companyNameLabel: UILabel!
    @IBOutlet private weak var staticYearOfFoundationLabel: UILabel!
    @IBOutlet private weak var yearOfFoundationLabel: UILabel!
    @IBOutlet private weak var staticIncomeForCompanyLabel: UILabel!
    @IBOutlet private weak var incomeForCompanyLabel: UILabel!
    @IBOutlet private weak var staticNumOfEmployeeLabel: UILabel!
    @IBOutlet private weak var numOfEmployeeLabel: UILabel!
    
    @IBOutlet private weak var dolarLabel: UILabel!
    @IBOutlet private weak var staticIncreaseIncomeLabel: UILabel!
    @IBOutlet private weak var increaseIncomeTextField: UITextField!
    @IBOutlet private weak var increaseIncomeButton: UIButton!
    
    @IBOutlet private weak var staticDecreaseIncomeLabel: UILabel!
    @IBOutlet private weak var decreaseIncomeButton: UIButton!
    @IBOutlet private weak var decreaseIncomeTextField: UITextField!
    
    
    @IBOutlet private weak var staticSalaryPaymentLabel: UILabel!
    @IBOutlet private weak var salaryPaymentTextField: UITextField!
    @IBOutlet private weak var salaryPaymentButton: UIButton!
    @IBOutlet private weak var employeeLabel: UILabel!
    
    @IBOutlet private weak var addEmployeeButton: UIButton!
    @IBOutlet private weak var listEmployeesButton: UIButton!
    
    let viewModel = AccessScreenViewModel()
    let addEmployeeViewModel = AddEmployeeScreenViewModel()
    
    var status = false
    override func viewDidLoad() {
        super.viewDidLoad()
        let deneme = AddEmployeeScreenViewController()
        viewModel.createData()
        var company = viewModel.getData()
        setupData(company: company)
        dolarLabel.text = "$"
        dolarLabel.font = dolarLabel.font.withSize(20)
        staticIncreaseIncomeLabel.text = "Enter the amount you want to add to the budget"
        staticIncreaseIncomeLabel.font = staticIncreaseIncomeLabel.font.withSize(20)
        increaseIncomeButton.setTitle("", for: .normal)
        staticDecreaseIncomeLabel.text = "Enter the amount you want to subtract from the budget"
        staticDecreaseIncomeLabel.font = staticDecreaseIncomeLabel.font.withSize(20)
        decreaseIncomeButton.setTitle("", for: .normal)
        
        staticSalaryPaymentLabel.text = "Enter the name of the employee you want to pay salary. The names are shown below."
        staticSalaryPaymentLabel.font = staticSalaryPaymentLabel.font.withSize(20)
        
        employeeLabel.text = viewModel.showEmployeeName(company: company)
        employeeLabel.font = employeeLabel.font.withSize(15)
        
        addEmployeeButton.setTitle("ADD EMPLOYEE", for: .normal)
        addEmployeeButton.backgroundColor = .systemBlue
        addEmployeeButton.setTitleColor(.white, for: .normal)
        addEmployeeButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        listEmployeesButton.setTitle("LIST EMPLOYEES", for: .normal)
        listEmployeesButton.setTitleColor(.white, for: .normal)
        listEmployeesButton.backgroundColor = .systemBlue
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if status {
            
           
            let company = viewModel.getNewData(newCompany: AddEmployeeScreenViewModel.addedData)
            setupData(company: company)
            dolarLabel.text = "$"
            dolarLabel.font = dolarLabel.font.withSize(20)
            staticIncreaseIncomeLabel.text = "Enter the amount you want to add to the budget"
            staticIncreaseIncomeLabel.font = staticIncreaseIncomeLabel.font.withSize(20)
            increaseIncomeButton.setTitle("", for: .normal)
            staticDecreaseIncomeLabel.text = "Enter the amount you want to subtract from the budget"
            staticDecreaseIncomeLabel.font = staticDecreaseIncomeLabel.font.withSize(20)
            decreaseIncomeButton.setTitle("", for: .normal)
            
            staticSalaryPaymentLabel.text = "Enter the name of the employee you want to pay salary. The names are shown below."
            staticSalaryPaymentLabel.font = staticSalaryPaymentLabel.font.withSize(20)
            
            employeeLabel.text = viewModel.showEmployeeName(company: company)
            employeeLabel.font = employeeLabel.font.withSize(15)
            
            addEmployeeButton.setTitle("ADD EMPLOYEE", for: .normal)
            addEmployeeButton.backgroundColor = .systemBlue
            addEmployeeButton.setTitleColor(.white, for: .normal)
            addEmployeeButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
            listEmployeesButton.setTitle("LIST EMPLOYEES", for: .normal)
            listEmployeesButton.setTitleColor(.white, for: .normal)
            listEmployeesButton.backgroundColor = .systemBlue
    }
    }
    
    func setupData(company: Company) {
        staticCompanyNameLabel.text = "Company Name"
        staticCompanyNameLabel.font = .boldSystemFont(ofSize: 20)
        companyNameLabel.text = company.companyName
        companyNameLabel.font = companyNameLabel.font.withSize(20)
        staticYearOfFoundationLabel.text = "Year Of Foundation"
        staticYearOfFoundationLabel.font = .boldSystemFont(ofSize: 20)
        yearOfFoundationLabel.text = String(company.yearOfFoundation ?? 0)
        yearOfFoundationLabel.font = yearOfFoundationLabel.font.withSize(20)
        staticIncomeForCompanyLabel.text = "Income"
        staticIncomeForCompanyLabel.font = .boldSystemFont(ofSize: 20)
        incomeForCompanyLabel.text = String(company.incomeForCompany ?? 0)
        incomeForCompanyLabel.font = incomeForCompanyLabel.font.withSize(20)
        staticNumOfEmployeeLabel.text = "Number of Employees"
        staticNumOfEmployeeLabel.font = .boldSystemFont(ofSize: 20)
        numOfEmployeeLabel.text = String(company.employee.count)
        numOfEmployeeLabel.font = numOfEmployeeLabel.font.withSize(20)
        
    }
    @IBAction private func incomeButtonTapped(_ sender: Any) {
        let text = increaseIncomeTextField.text ?? ""
        if let num = Double(text) {
            let newIncome = viewModel.increaseIncome(income: incomeForCompanyLabel.text ?? "0", value: num)
            incomeForCompanyLabel.text = String(newIncome)
        }
        
    }
    
    @IBAction func decreaseIncomeButtonTapped(_ sender: Any) {
        let text = decreaseIncomeTextField.text ?? ""
        if let num = Double(text) {
            let newIncome = viewModel.decreaseIncome(income: incomeForCompanyLabel.text ?? "0", value: num)
            incomeForCompanyLabel.text = String(newIncome)
        }
    }
    
    @IBAction func salaryPayButtonTapped(_ sender: Any) {
        let text = salaryPaymentTextField.text ?? ""
        if status {
            let company =  viewModel.getNewData(newCompany: AddEmployeeScreenViewModel.addedData)
            let newIncome = viewModel.salaryPayment(company: company, employeeName: text,income: incomeForCompanyLabel.text ?? "0")
            incomeForCompanyLabel.text = String(newIncome)
            
        } else {
            let company = viewModel.getData()
            let newIncome = viewModel.salaryPayment(company: company, employeeName: text,income: incomeForCompanyLabel.text ?? "0")
            incomeForCompanyLabel.text = String(newIncome)
        }
        
        
    }
    
    @IBAction func addEmployeeButtonTapped(_ sender: Any) {
        status = true
        let addEmployeeScreenViewController = AddEmployeeScreenViewController()
        self.navigationController?.pushViewController(addEmployeeScreenViewController, animated: true)
    }
    
    @IBAction func listEmployeesButtonTapped(_ sender: Any) {
        let listEmployeeViewController = ListEmployeeViewController()
        self.navigationController?.pushViewController(listEmployeeViewController, animated: true)
    }
    
}

