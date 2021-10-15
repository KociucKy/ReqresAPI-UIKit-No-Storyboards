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
        getUsersInfo()
    }
    
    
    //MARK: - Methods
    func configureVC(){
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureTableView(){
        userTableView = UITableView()
        userTableView.dataSource = self
        userTableView.delegate = self
        userTableView.backgroundColor  = .systemBackground
        userTableView.separatorStyle = .none
        
        view.addSubview(userTableView)
        userTableView.register(UserCell.self, forCellReuseIdentifier: UserCell.reuseID)
        userTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userTableView.topAnchor.constraint(equalTo: view.topAnchor),
            userTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: K.TableView.tableViewHorizontalPadding),
            userTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -K.TableView.tableViewHorizontalPadding),
            userTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    //MARK: - Network Call
    func getUsersInfo(){
        NetworkManager.shared.getUsersData { [weak self] result in
            guard let self = self else { return }
            
            switch result{
            case .success(let userData):
                let list = userData.data
                self.userInfo.append(contentsOf: list)
                DispatchQueue.main.async{ self.userTableView.reloadData() }
            case .failure(let error):
                self.displayAnAlert(title: K.Alerts.anErrorOccured, message: error.rawValue, action: K.Alerts.alertAction)
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
        return K.TableView.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return K.TableView.paddingBetweenCells
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return K.TableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: UserCell.reuseID, for: indexPath) as! UserCell
        cell.backgroundColor = .secondarySystemBackground
        cell.layer.cornerRadius = K.TableView.cellCornerRadius
        cell.clipsToBounds = true
        cell.selectionStyle = .none
        cell.set(list: userInfo, index: indexPath.section)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destVC = UserDetailVC()
        destVC.firstName = userInfo[indexPath.section].first_name
        destVC.lastName = userInfo[indexPath.section].last_name
        destVC.email = userInfo[indexPath.section].email
        
        let navController = UINavigationController(rootViewController: destVC)
        present(navController, animated: true)
        
        userTableView.deselectRow(at: indexPath, animated: true)
    }
}
