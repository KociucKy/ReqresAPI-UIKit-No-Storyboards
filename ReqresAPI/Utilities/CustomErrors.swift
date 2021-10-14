//
//  CustomErrors.swift
//  ReqresAPI
//
//  Created by Kuba Kociucki on 14/10/2021.
//

import Foundation

enum CustomErrors: String, Error{
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your Internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
