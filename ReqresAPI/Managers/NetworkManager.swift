//
//  NetworkManager.swift
//  ReqresAPI
//
//  Created by Kuba Kociucki on 14/10/2021.
//

import Foundation

class NetworkManager{
    //MARK: - Properties
    static let shared = NetworkManager()
    private let endpoint = "https://reqres.in/api/users"
    
    private init() {}
    
    func getUsersData(completed: @escaping (Result<User, CustomErrors>) -> Void){
        guard let url = URL(string: endpoint) else{
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error{
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else{
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let users = try decoder.decode(User.self, from: data)
                completed(.success(users))
            }catch{
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
