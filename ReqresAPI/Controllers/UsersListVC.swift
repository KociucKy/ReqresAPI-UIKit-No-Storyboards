//
//  UsersTableVC.swift
//  ReqresAPI
//
//  Created by Kuba Kociucki on 14/10/2021.
//

import UIKit

class UsersListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    
    
    //MARK: - Methods
    func configureVC(){
        view.backgroundColor = .systemPink
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
