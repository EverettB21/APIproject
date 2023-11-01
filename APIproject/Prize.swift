//
//  Prize.swift
//  APIproject
//
//  Created by Everett Brothers on 10/25/23.
//

import Foundation

struct Prize: Codable {
    
    var year: String? = nil
    var category: String? = nil
    var laureates: [Laureates]? = []
    
    enum CodingKeys: String, CodingKey {
        case year = "year"
        case category = "category"
        case laureates = "laureates"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        year = try values.decodeIfPresent(String.self, forKey: .year)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        laureates = try values.decodeIfPresent([Laureates].self, forKey: .laureates)
        
    }
    
    init() {
        
    }
}
