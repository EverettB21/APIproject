//
//  Dog.swift
//  APIproject
//
//  Created by Everett Brothers on 10/25/23.
//

import Foundation

struct Dog: Codable {
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case message
    }
}
