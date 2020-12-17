//
//  NetworkManager.swift
//  GoRestTest
//
//  Created by Rodrigo Hernández Gómez on 17/12/2020.
//  Copyright © 2020 Rodrigo Hernández Gómez. All rights reserved.
//

import Foundation

class Network {
    
    static var shared: Network = Network()
    
}


protocol GoRestAPI {
    
    func getUsers()
    
    func postUser()
    
    func patchUser()
    
    func putUser()
    
    func deleteUser()
    
}


extension Network: GoRestAPI {
    
    static let ACCESS_TOKEN = "aba8acb8ac933ecb3f0d9863142b736e1b56a9fbc359581d5abf44284501bffc"
    
    //TODO
    func getUsers() {
        URLSession.shared.dataTask(with: URL(string: "https://gorest.co.in/public-api/users")!) { data, urlResponse, error in
            
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                guard let data = data else { return }
                print(data)
            }
            
        }.resume()
    }
    
    //TODO
    func postUser() {
        var request = URLRequest(url: URL(string: "https://gorest.co.in/public-api/users")!)
        
        request.addValue("Bearer \(Network.ACCESS_TOKEN)", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: {'name':'marvin', 'gender':'male','email':'marvin.com'}  , options: [])
        }catch {
            print(error.localizedDescription)
        }
        
        
        URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            
            if error != nil {
                return
            }
            
            DispatchQueue.main.async {
                guard let data = data else { return }
                print(data)
            }
            
        }.resume()
    }
    
    //TODO
    func patchUser() {
        
    }
    
    //TODO
    func putUser() {
        
    }
    
    //TODO
    func deleteUser() {
        
    }
    
}
