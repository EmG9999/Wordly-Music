//
//  Token.swift
//  Wordy-Music
//
//  Created by Apprenant 165 on 06/11/2024.
//

import Foundation

struct JWToken: Codable {
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case value = "token"
    }
}
