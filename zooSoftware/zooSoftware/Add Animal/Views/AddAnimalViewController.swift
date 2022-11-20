//
//  AddAnimalViewController.swift
//  zooSoftware
//
//  Created by Mehmet Biçici on 20.11.2022.
//

import UIKit

class AddAnimalViewController: UIViewController {

    @IBOutlet private weak var animalTextFieldForAnimal: UITextField!
    @IBOutlet private weak var waterConsumptionTextField: UITextField!
    @IBOutlet private weak var soundTextField: UITextField!
    @IBOutlet private weak var navBar: UINavigationBar!
    @IBOutlet weak var addAnimalButton: UIButton!
    @IBOutlet private weak var checkSound: UILabel!
    @IBOutlet private weak var checkAnimal: UILabel!
    
    let viewModel = AddAnimalViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(named: "back.png"), for: .normal)
        backbutton.setTitle("Back", for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal)
        backbutton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        navBar.topItem?.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        animalTextFieldForAnimal.addTarget(self, action: #selector(animalTextFieldForAnimalDidChanged), for: .editingChanged)
        soundTextField.addTarget(self, action: #selector(soundTextFieldDidChanged), for: .editingChanged)
        
        addAnimalButton.isEnabled = false
    }
    
    @IBAction func addAnimalButtonTapped(_ sender: Any) {
        var data = viewModel.getDataForAdding()
        if animalTextFieldForAnimal.text == AnimalTypesEnum.cat.animal {
            data = viewModel.addNewAnimal(zooObject: data, animalList: Animal(animal: .cat, waterConsumption: 120, sound: .miyav))
            viewModel.createNewData(newData: data)
            AddCaregiverViewModel.addedData = data
        } else if animalTextFieldForAnimal.text == AnimalTypesEnum.dog.animal {
            data = viewModel.addNewAnimal(zooObject: data, animalList: Animal(animal: .dog, waterConsumption: 120, sound: .havhav))
            viewModel.createNewData(newData: data)
            AddCaregiverViewModel.addedData = data
        } else if animalTextFieldForAnimal.text == AnimalTypesEnum.cow.animal {
            data = viewModel.addNewAnimal(zooObject: data, animalList: Animal(animal: .cow, waterConsumption: 120, sound: .mö))
            viewModel.createNewData(newData: data)
            AddCaregiverViewModel.addedData = data
        } else if animalTextFieldForAnimal.text == AnimalTypesEnum.sheep.animal {
            data = viewModel.addNewAnimal(zooObject: data, animalList: Animal(animal: .sheep, waterConsumption: 120, sound: .me))
            viewModel.createNewData(newData: data)
            AddCaregiverViewModel.addedData = data
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func animalTextFieldForAnimalDidChanged() {
        
        if animalTextFieldForAnimal.text ?? "" == "cat" || animalTextFieldForAnimal.text ?? "" == "dog" || animalTextFieldForAnimal.text ?? "" == "cow" || animalTextFieldForAnimal.text ?? "" == "sheep" {
            addAnimalButton.isEnabled = true
            checkAnimal.text = " "
        } else {
            addAnimalButton.isEnabled = false
            checkAnimal.text = "Error! Animal didn't found !"
        }
    }
    
    @objc func soundTextFieldDidChanged() {
        if soundTextField.text ?? "" == "miyav" || soundTextField.text ?? "" == "hav" || soundTextField.text ?? "" == "mo" || soundTextField.text ?? "" == "me" {
            addAnimalButton.isEnabled = true
            checkSound.text = " "
        } else {
            addAnimalButton.isEnabled = false
            checkSound.text = "Error! Sound didn't found !"
        }
    }
}
