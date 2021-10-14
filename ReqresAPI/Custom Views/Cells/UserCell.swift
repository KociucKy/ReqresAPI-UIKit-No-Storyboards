//
//  UserCell.swift
//  ReqresAPI
//
//  Created by Kuba Kociucki on 14/10/2021.
//

import UIKit

class UserCell: UITableViewCell {

    //MARK: - UI Elements
    static let reuseID = "UserCell"
    let fullName = CustomTitleLabel(fontSize: 20, textAlignment: .left)
    
    
    //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Methods
    private func configure(){
        self.accessoryType = .disclosureIndicator
        addSubview(fullName)
        fullName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fullName.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            fullName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            fullName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            fullName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
        ])
    }
    
    
    func set(list: [UserData], index: Int){
        fullName.text = list[index].first_name + " " + list[index].last_name
    }
}
