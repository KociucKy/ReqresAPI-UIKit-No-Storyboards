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
    var userInfo: [UserData] = []
    
    
    
    //MARK: - VC Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureTableView()
    }
    
    
    //MARK: - Methods
    func configureVC(){
        view.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureTableView(){
        userTableView = UITableView()
        userTableView.dataSource = self
        userTableView.backgroundColor  = .secondarySystemBackground
        userTableView.separatorStyle = .none
        getUsersInfo()
        
        view.addSubview(userTableView)
        userTableView.register(UserCell.self, forCellReuseIdentifier: UserCell.reuseID)
        userTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userTableView.topAnchor.constraint(equalTo: view.topAnchor),
            userTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    //MARK: - Network Call
    func getUsersInfo(){
        NetworkManager.shared.getUsersData { [weak self] result in
            guard let self = self else { return }
            
            switch result{
            case .success(let userData): print("SUCCESS")
            case .failure(let error): print("\(error), you peace of shit")
            }
        }
    }
}


//MARK: - UITableView DataSource and Delegate Methods
extension UsersListVC: UITableViewDataSource, UITableViewDelegate{
    
    //I'm using Sections with one row inside, to give cells a padding between them
    func numberOfSections(in tableView: UITableView) -> Int {
        return userInfo.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: UserCell.reuseID, for: indexPath) as! UserCell
        cell.backgroundColor = .systemBackground
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        cell.set(list: userInfo, index: indexPath.section)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //More on later
    }
}
