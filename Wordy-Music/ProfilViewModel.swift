//
//  ProfilViewModel.swift
//  Wordy-Music
//
//  Created by Apprenant 178 on 21/10/2024.
//
import Foundation

class ProfilViewModel: ObservableObject {
    @Published var profil: ProfilModel = ProfilModel()
    @Published var isLoggedIn = false

    private let baseURL = "http://127.0.0.1:8081/user/7D79D3E1-D280-4637-A5C4-FCAD15AF762C"
    
    func fetchProfil() {

        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(ProfilModel.self, from: data)
                    DispatchQueue.main.async {
                        self.profil = decodedData 
                        print(self.profil)
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
    
    
    
    func updatePseudo(_ profil: ProfilModel) {
            guard let url = URL(string: "\(baseURL)\(profil.id)") else {
                print("Invalid URL")
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            do {
                let data = try JSONEncoder().encode(profil)
                request.httpBody = data
            } catch {
                print("Error encoding contact: \(error)")
                return
            }

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error updating contact: \(error)")
                    return
                }
                self.fetchProfil()
            }.resume()
        }
    
    func register(email: String, password: String) {
        let url = URL(string: "http://127.0.0.1:8081/user")
        var request = URLRequest(url: url!)
        
       
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
   
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: ["email": email, "password": password])
        } catch {
            print(error)
        }
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error,
               let responseHttp = response as? HTTPURLResponse, responseHttp.statusCode != 200{
                print("\(error)")
                return
            }
            print("Pas d'erreur dans l'execution de la requête")
        }.resume()
    }
    func login(email: String, password: String) {
        let url = URL(string: "http://127.0.0.1:8081/user/login")
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let authData = (email + ":" + password).data(using: .utf8)!.base64EncodedString()
        request.addValue("Basic \(authData)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil,
                  let responseHttp = response as? HTTPURLResponse, responseHttp.statusCode == 200, let data = data else {
                print("\(String(describing: error?.localizedDescription))")
                return
            }
            
            print("Authentification réussie")
            
            do {
                let token = try JSONDecoder().decode(JWToken.self, from: data)
                print("token : ", token.value)
                KeyChainManager.save(token: token.value)
                
//                print(KeyChainManager.get())
                
            } catch {
                print("Il y a une erreur dans le decodage du token")
            }
            
            
            
        }.resume()
    }
    func logOut() {
        KeyChainManager.deleteToken()
        isLoggedIn = false
    }

//    /// Fonction de validation de l'email avec regex simple
//        private func isValidEmail(_ email: String) -> Bool {
//            // Modèle regex simplifié pour valider l'adresse email
//            let emailRegEx = "^[A-Za-z0-9.%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"
//            let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
//            return emailPred.evaluate(with: email)
//        }
//    
//    /// Fonction pour valider les informations d'authentification
//        private func validateCredentials() -> Bool {
//            // Vérifie que les champs ne sont pas vides
//            if email.isEmpty || password.isEmpty {
//                errorMessage = "L'email et le mot de passe ne peuvent pas être vides."
//                return false
//            }
//
//            // Vérifie que l'email est valide
//            if !isValidEmail(email) {
//                errorMessage = "Veuillez entrer une adresse email valide."
//                return false
//            }
//
//            return true // Retourne vrai si toutes les validations passent
//        }
}
