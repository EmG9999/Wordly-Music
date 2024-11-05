//
//  ProfilViewModel.swift
//  Wordy-Music
//
//  Created by Apprenant 178 on 21/10/2024.
//
import Foundation

class ProfilViewModel: ObservableObject {
    @Published var profil: ProfilModel = ProfilModel()

    private let baseURL = "http://127.0.0.1:8081/user/45740AFF-D71E-4118-988B-F8CB9BA90D1D"
    
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
            guard let url = URL(string: "\(baseURL)/\(profil.id)") else {
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
}
