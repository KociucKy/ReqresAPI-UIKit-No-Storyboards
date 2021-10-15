//
//  UserDetailVC.swift
//  ReqresAPI
//
//  Created by Kuba Kociucki on 14/10/2021.
//

import UIKit

class UserDetailVC: UIViewController {
    
    //MARK: - Properties
    var firstName = ""
    var lastName = ""
    var email = ""
    
    
    //MARK: - UI Elements
    var container = UIView()
    var firstNameLabel = CustomTitleLabel(fontSize: K.Labels.labelFontSize, textAlignment: .center)
    var lastNameLabel = CustomTitleLabel(fontSize: K.Labels.labelFontSize, textAlignment: .center)
    var emailLabel = CustomTitleLabel(fontSize: K.Labels.labelFontSize, textAlignment: .center)
    var firstNameValue = CustomBodyLabel(textAlignment: .center)
    var lastNameValue = CustomBodyLabel(textAlignment: .center)
    var emailValue = CustomBodyLabel(textAlignment: .center)
    

    //MARK: - VC Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureContainer()
        layoutUI()
    }
    
    
    //MARK: - Methods
    func configureVC(){
        title = "Detail Information"
        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }
    
    
    func configureContainer(){
        view.addSubview(container)
        container.backgroundColor = .secondarySystemBackground
        container.layer.cornerRadius = K.Container.containerCornerRadius
        container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.heightAnchor.constraint(equalToConstant: K.Container.containerHeight),
            container.widthAnchor.constraint(equalToConstant: K.Container.containerWidth)
        ])
    }
    
    
    func layoutUI(){
        let elements = [firstNameLabel, lastNameLabel, emailLabel, firstNameValue, lastNameValue, emailValue]
        for element in elements {
            container.addSubview(element)
            element.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                element.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: K.Labels.labelHorizontalPadding),
                element.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -K.Labels.labelHorizontalPadding),
                element.heightAnchor.constraint(equalToConstant: K.Labels.labelHeight),
            ])
        }
        
        firstNameLabel.text = "First Name:"
        firstNameValue.text = firstName
        lastNameLabel.text = "Last Name:"
        lastNameValue.text = lastName
        emailLabel.text = "Email:"
        emailValue.text = email
        
        NSLayoutConstraint.activate([
            firstNameLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: K.Labels.labelBigPadding),
            firstNameValue.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: K.Labels.labelSmallPadding),
            
            lastNameLabel.topAnchor.constraint(equalTo: firstNameValue.bottomAnchor, constant: K.Labels.labelBigPadding),
            lastNameValue.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: K.Labels.labelSmallPadding),
            
            emailLabel.topAnchor.constraint(equalTo: lastNameValue.bottomAnchor, constant: K.Labels.labelBigPadding),
            emailValue.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: K.Labels.labelSmallPadding)
        ])
    }
}
