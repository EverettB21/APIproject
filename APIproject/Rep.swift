//
//  Rep.swift
//  APIproject
//
//  Created by Everett Brothers on 10/25/23.
//

import Foundation

struct Rep: Codable {
    var name: String
    var party: String
    var state: String
    var district: String
    var phone: String
    var office: String
    var link: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case party
        case state
        case district
        case phone
        case office
        case link
    }
}
