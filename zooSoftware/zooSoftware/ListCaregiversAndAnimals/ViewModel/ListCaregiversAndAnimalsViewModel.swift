//
//  ListCaregiversAndAnimalsViewModel.swift
//  zooSoftware
//
//  Created by Mehmet Biçici on 20.11.2022.
//

import Foundation

class ListCaregiversAndAnimalsViewModel {
    
    func getDataForCaregivers() -> [Caregiver] {
        return AddCaregiverViewModel.addedData.caregiver
    }
    
    func getDataForAnimals() -> [Animal] {
        return AddCaregiverViewModel.addedData.animal
    }
    
}
