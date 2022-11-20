//
//  MainPageViewModel.swift
//  zooSoftware
//
//  Created by Mehmet Biçici on 20.11.2022.
//

import Foundation

class MainPageViewModel {
    
    var defaultData = Zoo(animal: [], caregiver: [])
    
    func createData() {
        defaultData.zooName = "Sigma Zoo"
        defaultData.income = 8500000
        defaultData.waterLimit = 2500
        defaultData.animal = [Animal(animal: .cat, waterConsumption: 25, sound: .miyav),Animal(animal: .sheep, waterConsumption: 50, sound: .me)]
        defaultData.caregiver = [Caregiver(id: 1, animalsToLookAt: Animal(animal: .cat, waterConsumption: 20, sound: .miyav), age: 30)]
    }
    
    func getData() -> Zoo {
        return defaultData
    }
    
    func increaseIncome(income: String, value: Double) -> Double  {
        if var income = Double(income) {
            income = income + value
            return income
        }
        return 0
    }
    
    func reduceIncome(income: String, value: Double) -> Double {
        if var income = Double(income) {
            income = income - value
            return income
        }
        return 0
    }
    
    func increaseWater(waterLimit: String, value: Double) -> Double  {
        if var waterLimit = Double(waterLimit) {
            waterLimit = waterLimit + value
            return waterLimit
        }
        return 0
    }
    
    func reduceWater(waterLimit: String, value: Double) -> Double {
        if var waterLimit = Double(waterLimit) {
            waterLimit = waterLimit - value
            return waterLimit
        }
        return 0
    }
    
    func getNewData(newZoo: Zoo) -> Zoo {
        return newZoo
    }
    
}
