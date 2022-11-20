//
//  SharedTableViewCell.swift
//  zooSoftware
//
//  Created by Mehmet Biçici on 20.11.2022.
//

import UIKit

class SharedTableViewCell: UITableViewCell {

    @IBOutlet private weak var labelForList: UILabel!
    
    func setup(animalOrCaregiver: String) {
        labelForList.text = animalOrCaregiver
    }
    
}
