//
//  ApiController.swift
//  APIproject
//
//  Created by Everett Brothers on 10/25/23.
//

import Foundation
import UIKit

class ApiController {
    enum ApiControllerError: Error, LocalizedError {
        case dogNotFound
        case repNotFound
        case prizeNotFound
    }
    
    func fetchDog() async throws -> Dog {
        let baseURL = URL(string: "https://dog.ceo/api/breeds/image/random")!
        let (data, response) = try await URLSession.shared.data(from: baseURL)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ApiControllerError.dogNotFound
        }
        let decoder = JSONDecoder()
        let dogResponse = try decoder.decode(Dog.self, from: data)
        print("data decoded")
        
        return dogResponse
    }
    
    func fetchReps(matching items: [URLQueryItem]) async throws -> [Rep] {
        var components = URLComponents(string: "http://whoismyrepresentative.com/getall_mems.php")!
        components.queryItems = items
        
        let (data, response) = try await URLSession.shared.data(from: components.url!)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw ApiControllerError.repNotFound
        }
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(RepResult.self, from: data)
        print("\(result.results.count)")
        return result.results
    }
    
    func fetchPrizes() async throws -> [Prize] {
        let baseURL = URL(string: "http://api.nobelprize.org/v1/prize.json")!
        
        let (data, response) = try await URLSession.shared.data(from: baseURL)
        guard let http = response as? HTTPURLResponse, http.statusCode == 200 else {
            throw ApiControllerError.prizeNotFound
        }
        
        let decoder = JSONDecoder()
        let result = try decoder.decode(PrizeResult.self, from: data)
        
        print("Prizes Decoded")
        
        return result.prizes!
    }
}
