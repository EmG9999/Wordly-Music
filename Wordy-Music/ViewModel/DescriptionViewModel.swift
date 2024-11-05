//
//  DescriptionViewModel.swift
//  Wordy-Music
//
//  Created by Apprenant 165 on 21/10/2024.
//

import Foundation

class DescriptionViewModel: ObservableObject {
    @Published var description: [Description] = []

    
    private let baseURL: String = "http://127.0.0.1:8081/sample"
    
    
    func fetchSample() {
        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedDescription = try JSONDecoder().decode([Description].self, from: data)
                    DispatchQueue.main.async {
                        self.description = decodedDescription
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
    
    func createSample(sample: Description) {
        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        do {
            let data = try JSONEncoder().encode(sample)
            request.httpBody = data
        } catch {
            print("Error encoding data : \(error)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data : \(error)")
                return
            }
            
            DispatchQueue.main.async {
                self.fetchSample()
            }
        }.resume()
    }
    
    
}
