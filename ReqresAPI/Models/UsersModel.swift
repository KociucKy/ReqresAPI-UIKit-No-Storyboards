//
//  UsersModel.swift
//  ReqresAPI
//
//  Created by Kuba Kociucki on 14/10/2021.
//

import Foundation

struct User: Codable{
    let data: [UserData]
}

struct UserData: Codable{
    let email: String
    let last_name: String
    let first_name: String
    let avatar: String
}
