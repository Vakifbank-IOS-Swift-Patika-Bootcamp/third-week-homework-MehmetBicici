//
//  AddAnimalViewModel.swift
//  zooSoftware
//
//  Created by Mehmet Biçici on 20.11.2022.
//

import Foundation

class AddAnimalViewModel {
    
    var data = MainPageViewModel()
    static var addedData = Zoo(animal: [], caregiver: [])
    
    func getDataForAdding() -> Zoo {
        if AddCaregiverViewModel.addedData.zooName != nil  {
            let difData = AddCaregiverViewModel.addedData
            return difData
        } else {
            data.createData()
            let difData = data.getData()
            return difData
        }
    }
    
    func addNewAnimal(zooObject: Zoo,animalList: Animal) -> Zoo {
        var placeHolderObject = zooObject
        let newAnimal = animalList
        var newAnimalList = placeHolderObject.animal
        newAnimalList.append(newAnimal)
        placeHolderObject = Zoo(zooName: placeHolderObject.zooName, income: placeHolderObject.income, waterLimit: placeHolderObject.waterLimit, animal: newAnimalList , caregiver: placeHolderObject.caregiver)
        print("Added New Animal: \(String(describing: (newAnimal.animal))) !!")
        print(" ")
        return placeHolderObject
    }
    func createNewData(newData: Zoo) {
        AddCaregiverViewModel.addedData = newData
    }
    
    func getData() -> Zoo {
        return AddCaregiverViewModel.addedData
    }
    
    
    
}
