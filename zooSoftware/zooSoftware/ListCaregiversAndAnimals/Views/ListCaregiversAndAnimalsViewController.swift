//
//  ListCaregiversAndAnimalsViewController.swift
//  zooSoftware
//
//  Created by Mehmet Biçici on 20.11.2022.
//

import UIKit

class ListCaregiversAndAnimalsViewController: UIViewController {
    
    @IBOutlet private weak var navBar: UINavigationBar!
    @IBOutlet private weak var animalTableView: UITableView!
    @IBOutlet private weak var caregiverTableView: UITableView!
    
    let viewModel = ListCaregiversAndAnimalsViewModel()
    let mainPageViewModel = MainPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalTableView.delegate = self
        animalTableView.dataSource = self
        animalTableView.register(cellClass: SharedTableViewCell.self)
        animalTableView.backgroundColor = .systemGray
        
        caregiverTableView.delegate = self
        caregiverTableView.dataSource = self
        caregiverTableView.register(cellClass: SharedTableViewCell.self)
        caregiverTableView.backgroundColor = .systemBlue

        
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(named: "back.png"), for: .normal)
        backbutton.setTitle("Back", for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal)
        backbutton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        navBar.topItem?.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
    }
    
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ListCaregiversAndAnimalsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if AddCaregiverViewModel.addedData.zooName != nil {
            var numberOfRow = 1
            switch tableView {
            case animalTableView:
                numberOfRow = AddCaregiverViewModel.addedData.caregiver.count
                print(numberOfRow)
            case caregiverTableView:
                numberOfRow = AddCaregiverViewModel.addedData.animal.count
                print(numberOfRow)
            default:
                print("Some things Wrong!!")
            }
            return numberOfRow
        } else {
            mainPageViewModel.createData()
            let data = mainPageViewModel.getData()
            var numberOfRow = 1
            switch tableView {
            case animalTableView:
                numberOfRow = data.animal.count
            case caregiverTableView:
                numberOfRow = data.caregiver.count
            default:
                print("Some things Wrong!!")
                
            }
            return numberOfRow
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SharedTableViewCell.reuseIdentifier, for: indexPath) as! SharedTableViewCell
        
        if AddCaregiverViewModel.addedData.zooName != nil {
            switch tableView {
            case animalTableView:
                cell.setup(animalOrCaregiver: viewModel.getDataForAnimals()[indexPath.row].animal?.animal ?? "")
                return cell
            case caregiverTableView:
                cell.setup(animalOrCaregiver: String(viewModel.getDataForCaregivers()[indexPath.row].id))
                return cell
            default:
                print("Some things Wrong!!")
            }
            return cell
        }
        else {
            switch tableView {
            case animalTableView:
                cell.setup(animalOrCaregiver: mainPageViewModel.getData().animal[indexPath.row].animal?.animal ?? "")
                return cell
            case caregiverTableView:
                cell.setup(animalOrCaregiver: String(mainPageViewModel.getData().caregiver[indexPath.row].id))
                return cell
            default:
                print("Some things Wrong!!")
            }
            return cell
        }
    }
}

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: Reusable { }

extension UITableView {
    
    func register<T: UITableViewCell>(cellClass: T.Type = T.self) {
        let bundle = Bundle(for: cellClass.self)
        if bundle.path(forResource: cellClass.reuseIdentifier, ofType: "nib") != nil {
            let nib = UINib(nibName: cellClass.reuseIdentifier, bundle: bundle)
            register(nib, forCellReuseIdentifier: cellClass.reuseIdentifier)
        } else {
            register(cellClass.self, forCellReuseIdentifier: cellClass.reuseIdentifier)
        }
    }
    
}
