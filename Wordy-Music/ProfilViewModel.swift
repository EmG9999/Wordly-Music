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
    
    func fetchProfil() {  // Prends l'ID de l'utilisateur en paramètre
        // Utilise l'ID dans l'URL

        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(ProfilModel.self, from: data)  // Décodage d'un seul profil
                    DispatchQueue.main.async {
                        self.profil = decodedData  // Mise à jour du profil récupéré
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
}
