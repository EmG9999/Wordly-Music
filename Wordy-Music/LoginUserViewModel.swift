//
//  LoginUserViewModel.swift
//  Wordy-Music
//
//  Created by Apprenant89 on 22/10/2024.
//

import Foundation

class LoginUserViewModel: ObservableObject {
    
    private let baseURL: String = "http://localhost:8081"
    
    func loginUser(email: String, password: String, completion: @escaping (Bool) -> Void) {
        
        guard let url = URL(string: "\(baseURL)/user/login") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let loginData = [
            "email": email,
            "password": password
        ]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: loginData, options: [])
            request.httpBody = data
        } catch {
            print("Error encoding data: \(error)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending login request: \(error)")
                DispatchQueue.main.async {
                    completion(false)
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {

                DispatchQueue.main.async {
                    completion(true)
                }
            } else {

                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }.resume()
    }
}
