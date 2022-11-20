//
//  AddCaregiverViewController.swift
//  zooSoftware
//
//  Created by Mehmet Biçici on 20.11.2022.
//

import UIKit

class AddCaregiverViewController: UIViewController {
    
    var viewModel = AddCaregiverViewModel()
    
    @IBOutlet private weak var navBar: UINavigationBar!
    @IBOutlet private weak var idTextField: UITextField!
    @IBOutlet private weak var ageTextField: UITextField!
    @IBOutlet private weak var animalTextFieldForCaregiver: UITextField!
    @IBOutlet private weak var salaryLabel: UILabel!
    @IBOutlet private weak var addCaregiverButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(named: "back.png"), for: .normal)
        backbutton.setTitle("Back", for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal)
        backbutton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        navBar.topItem?.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        animalTextFieldForCaregiver.addTarget(self, action: #selector(animalTextFieldDidChanged), for: .editingChanged)
        addCaregiverButton.isEnabled = false
    }

    @IBAction func addCaregiverButtonTapped(_ sender: Any) {
        var data = viewModel.getDataForAdding()
        if animalTextFieldForCaregiver.text == AnimalTypesEnum.cat.animal {
            data = viewModel.addNewCaregiver(zooObject: data, caregiverList: Caregiver(id: Int(idTextField.text ?? "0") ?? 0, animalsToLookAt: Animal(animal: .cat, waterConsumption: 90, sound: .miyav), age: Int(ageTextField.text ?? "0") ?? 0))
            viewModel.createNewData(newData: data)
            AddCaregiverViewModel.addedData = data
            salaryLabel.text = String(AddCaregiverViewModel.addedData.caregiver[AddCaregiverViewModel.addedData.caregiver.count - 1].salary ?? 0) + "$"
        } else if animalTextFieldForCaregiver.text == AnimalTypesEnum.dog.animal {
            data = viewModel.addNewCaregiver(zooObject: data, caregiverList: Caregiver(id: Int(idTextField.text ?? "0") ?? 0, animalsToLookAt: Animal(animal: .dog, waterConsumption: 90, sound: .havhav), age: Int(ageTextField.text ?? "0") ?? 0))
            viewModel.createNewData(newData: data)
            AddCaregiverViewModel.addedData = data
            salaryLabel.text = String(AddCaregiverViewModel.addedData.caregiver[AddCaregiverViewModel.addedData.caregiver.count - 1].salary ?? 0) + "$"
        } else if animalTextFieldForCaregiver.text == AnimalTypesEnum.cow.animal {
            data = viewModel.addNewCaregiver(zooObject: data, caregiverList: Caregiver(id: Int(idTextField.text ?? "0") ?? 0, animalsToLookAt: Animal(animal: .cow, waterConsumption: 90, sound: .mö), age: Int(ageTextField.text ?? "0") ?? 0))
            viewModel.createNewData(newData: data)
            AddCaregiverViewModel.addedData = data
            salaryLabel.text = String(AddCaregiverViewModel.addedData.caregiver[AddCaregiverViewModel.addedData.caregiver.count - 1].salary ?? 0) + "$"
        } else if animalTextFieldForCaregiver.text == AnimalTypesEnum.sheep.animal {
            data = viewModel.addNewCaregiver(zooObject: data, caregiverList: Caregiver(id: Int(idTextField.text ?? "0") ?? 0, animalsToLookAt: Animal(animal: .sheep, waterConsumption: 90, sound: .me), age: Int(ageTextField.text ?? "0") ?? 0))
            viewModel.createNewData(newData: data)
            AddCaregiverViewModel.addedData = data
            salaryLabel.text = String(AddCaregiverViewModel.addedData.caregiver[AddCaregiverViewModel.addedData.caregiver.count - 1].salary ?? 0) + "$"
        }
        self.navigationController?.popViewController(animated: true)
    }
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func animalTextFieldDidChanged() {
        if animalTextFieldForCaregiver.text ?? "" == "cat" || animalTextFieldForCaregiver.text ?? "" == "dog" || animalTextFieldForCaregiver.text ?? "" == "cow" || animalTextFieldForCaregiver.text ?? "" == "sheep" {
            addCaregiverButton.isEnabled = true
            salaryLabel.text = ""
        } else {
            addCaregiverButton.isEnabled = false
            salaryLabel.text = "Error! Animal's not found !"
        }
    }
}
