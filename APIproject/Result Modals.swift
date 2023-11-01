//
//  Result Modals.swift
//  APIproject
//
//  Created by Everett Brothers on 10/25/23.
//

import Foundation
import UIKit

struct RepResult: Codable {
    var results: [Rep]
}

struct PrizeResult: Codable {
    
    var prizes: [Prize]? = []
    
    enum CodingKeys: String, CodingKey {
        case prizes = "prizes"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        prizes = try values.decodeIfPresent([Prize].self , forKey: .prizes )
    }
    
    init() {
        
    }
    
}
