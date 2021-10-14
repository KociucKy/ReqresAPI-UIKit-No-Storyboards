//
//  UsersTableVC.swift
//  ReqresAPI
//
//  Created by Kuba Kociucki on 14/10/2021.
//

import UIKit

class UsersListVC: UIViewController {
    
    //MARK: - Properties
    var userTableView: UITableView!
    
    
    //MARK: - VC Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureTableView()
    }
    
    
    //MARK: - Methods
    func configureVC(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureTableView(){
        userTableView = UITableView()
        userTableView.dataSource = self
        
        view.addSubview(userTableView)
        userTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userTableView.topAnchor.constraint(equalTo: view.topAnchor),
            userTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


//MARK: - UITableView DataSource and Delegate Methods
extension UsersListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .systemGreen
        return cell
    }
    
    
}
