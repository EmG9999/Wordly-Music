//
//  ProfilViewModel.swift
//  Wordy-Music
//
//  Created by Apprenant 178 on 21/10/2024.
//
import Foundation

class ProfilViewModel: ObservableObject {
    @Published var profil: ProfilModel = ProfilModel()

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
    
    
}
