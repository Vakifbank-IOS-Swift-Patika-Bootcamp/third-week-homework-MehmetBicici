//
//  Caregiver.swift
//  zooSoftware
//
//  Created by Mehmet Biçici on 20.11.2022.
//

import Foundation

struct Caregiver {
    var id: Int
    var animalsToLookAt: Animal
    var age: Int
    var salary: Int? {
        // Salary Formula = age * id * 50
        return age * id * 50
    }
}
