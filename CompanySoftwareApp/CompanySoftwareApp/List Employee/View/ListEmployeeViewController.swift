//
//  ListEmployeeViewController.swift
//  CompanySoftwareApp
//
//  Created by Mehmet Biçici on 19.11.2022.
//

import UIKit

class ListEmployeeViewController: UIViewController {
    var viewModel = ListEmployeeViewModel()
    var acccesScreenViewModel = AccessScreenViewModel()
    @IBOutlet private weak var navigationBar: UINavigationBar!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellClass: ListeEmployeeTableViewCell.self)
        searchBar.delegate = self
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(named: "backButton.png"), for: .normal)
        backbutton.setTitle("Back", for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal)
        backbutton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        
    }
    
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ListEmployeeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if AddEmployeeScreenViewModel.addedData.companyName != nil {
            return AddEmployeeScreenViewModel.addedData.employee.count
        } else {
            acccesScreenViewModel.createData()
            let data = acccesScreenViewModel.getData()
            return data.employee.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListeEmployeeTableViewCell.reuseIdentifier, for: indexPath) as! ListeEmployeeTableViewCell
        
        if AddEmployeeScreenViewModel.addedData.companyName != nil {
            cell.setup(employee: viewModel.getData()[indexPath.row].employeeName)
            return cell
        } else {
            cell.setup(employee: acccesScreenViewModel.getData().employee[indexPath.row].employeeName)
            return cell
        }

    }
    
}
extension ListEmployeeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
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
