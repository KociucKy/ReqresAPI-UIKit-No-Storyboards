//
//  UIViewController+Ext.swift
//  ReqresAPI
//
//  Created by Kuba Kociucki on 15/10/2021.
//

import UIKit

extension UIViewController{
    func displayAnAlert(title: String, message: String, action: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: action, style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async {self.present(alert, animated: true, completion: nil)}
    }
}
