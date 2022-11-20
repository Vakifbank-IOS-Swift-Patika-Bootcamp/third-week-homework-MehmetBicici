//
//  MainPageViewController.swift
//  zooSoftware
//
//  Created by Mehmet Biçici on 20.11.2022.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var numOfCaregiverLabel: UILabel!
    @IBOutlet private weak var numOfAnimalLabel: UILabel!
    @IBOutlet private weak var incomeLabel: UILabel!
    @IBOutlet private weak var waterLimitLabel: UILabel!
    @IBOutlet weak var addIncomeTextField: UITextField!
    @IBOutlet weak var reduceIncomeTextField: UITextField!
    @IBOutlet weak var addWaterTextField: UITextField!
    @IBOutlet weak var reduceWaterTextField: UITextField!
    
    let viewModel = MainPageViewModel()
    var status = false
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.createData()
        let baseData = viewModel.getData()
        setup(zoo: baseData)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if status {
            let newBaseData = viewModel.getNewData(newZoo: AddCaregiverViewModel.addedData)
            setup(zoo: newBaseData)
        }
    }
    
    func setup(zoo: Zoo) {
        nameLabel.text = zoo.zooName ?? ""
        numOfAnimalLabel.text = String(zoo.animal.count)
        numOfCaregiverLabel.text = String(zoo.caregiver.count)
        waterLimitLabel.text = String(zoo.waterLimit ?? 0)
        incomeLabel.text = String(zoo.income ?? 0)
    }
    
    @IBAction func addIncomeButtonTapped(_ sender: Any) {
        let text = addIncomeTextField.text ?? ""
        if let num = Double(text) {
            let newIncome = viewModel.increaseIncome(income: incomeLabel.text ?? "0", value: num)
            incomeLabel.text = String(newIncome)
        }
    }
    
    @IBAction func reduceIncomeButtonTapped(_ sender: Any) {
        let text = addIncomeTextField.text ?? ""
        if let num = Double(text) {
            let newIncome = viewModel.reduceIncome(income: incomeLabel.text ?? "0", value: num)
            incomeLabel.text = String(newIncome)
        }
    }
    
    @IBAction func addWaterButtonTapped(_ sender: Any) {
        let text = addWaterTextField.text ?? ""
        if let num = Double(text) {
            let newWaterLimit = viewModel.increaseWater(waterLimit: waterLimitLabel.text ?? "0", value: num)
            waterLimitLabel.text = String(newWaterLimit)
        }
    }
    
    @IBAction func reduceWaterButton(_ sender: Any) {
        let text = reduceWaterTextField.text ?? ""
        if let num = Double(text) {
            let newWaterLimit = viewModel.reduceWater(waterLimit: waterLimitLabel.text ?? "0", value: num)
            waterLimitLabel.text = String(newWaterLimit)
        }
    }
    
    @IBAction func addCaregiverButtonTapped(_ sender: Any) {
        status = true
        let addCaregiveriewController = AddCaregiverViewController()
        self.navigationController?.pushViewController(addCaregiveriewController, animated: true)
    }
    
    @IBAction func addAnimalButtonTapped(_ sender: Any) {
        status = true
        let addAnimalViewController = AddAnimalViewController()
        self.navigationController?.pushViewController(addAnimalViewController, animated: true)
    }
    
    @IBAction func listCaregiverAndAnimalButtonTapped(_ sender: Any) {
        let listCaregiversAndAnimalsViewController = ListCaregiversAndAnimalsViewController()
        self.navigationController?.pushViewController(listCaregiversAndAnimalsViewController, animated: true)
    }
    
    
}
