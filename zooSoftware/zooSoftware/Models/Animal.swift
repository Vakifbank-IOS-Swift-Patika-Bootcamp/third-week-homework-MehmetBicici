//
//  Animal.swift
//  zooSoftware
//
//  Created by Mehmet Biçici on 20.11.2022.
//

import Foundation

struct Animal {
    
    var animal: AnimalTypesEnum?
    var waterConsumption: Int?
    var sound: SoundTypesEnum?
}

enum AnimalTypesEnum {
    
    case cat
    case dog
    case cow
    case sheep
    case empty
    var animal: String {
        switch self {
        case .cat:
            return "cat"
        case .cow:
            return "cow"
        case .dog:
            return "dog"
        case .sheep:
            return "sheep"
        case .empty:
            return "empty"
        }
    }
}

enum SoundTypesEnum {

    case me
    case miyav
    case havhav
    case mö
    case empty
    var sound: String {
        switch self {
        case .havhav:
            return "hav"
        case .me:
            return "me"
        case .miyav:
            return "miyav"
        case .mö:
            return "mo"
        case .empty:
            return "Empty"
        }
        
    }
}
