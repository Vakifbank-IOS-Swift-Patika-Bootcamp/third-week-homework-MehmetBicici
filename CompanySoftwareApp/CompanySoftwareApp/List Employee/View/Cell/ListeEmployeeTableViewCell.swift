//
//  ListeEmployeeTableViewCell.swift
//  CompanySoftwareApp
//
//  Created by Mehmet Biçici on 19.11.2022.
//

import UIKit

class ListeEmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    func setup(employee: String) {
        nameLabel.text = employee
    }
    
}
