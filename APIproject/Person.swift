//
//  Person.swift
//  APIproject
//
//  Created by Everett Brothers on 10/25/23.
//

import Foundation

struct Laureates: Codable {
    
    var id: String? = nil
    var firstname: String? = nil
    var surname: String? = nil
    var motivation: String? = nil
    var share: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstname = "firstname"
        case surname = "surname"
        case motivation = "motivation"
        case share = "share"
    }
}
