//
//  AddCaregiverViewModel.swift
//  zooSoftware
//
//  Created by Mehmet Biçici on 20.11.2022.
//

import Foundation

class AddCaregiverViewModel {
    
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
    
    func addNewCaregiver(zooObject: Zoo,caregiverList: Caregiver) -> Zoo {
        var placeHolderObject = zooObject
        let newCaregiver = caregiverList
        var newCaregiverList = placeHolderObject.caregiver
        newCaregiverList.append(newCaregiver)
        placeHolderObject = Zoo(zooName: placeHolderObject.zooName, income: placeHolderObject.income, waterLimit: placeHolderObject.waterLimit, animal: placeHolderObject.animal, caregiver: newCaregiverList)
        print("Added New Caregiver: \((newCaregiver.id)) !!")
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
