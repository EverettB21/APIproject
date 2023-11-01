//
//  ViewController.swift
//  APIproject
//
//  Created by Everett Brothers on 10/25/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let apiController = ApiController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 20
        
        Task {
            do {
                let dog = try await apiController.fetchDog()
                let url = URL(string: dog.message)!
                let (data, response) = try await URLSession.shared.data(from: url)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("failed to load image")
                    return
                }
                imageView.image = UIImage(data: data)
            } catch {
                print("Failed to load dog image: \(error.localizedDescription)")
            }
        }
    }

    @IBAction func newImage(_ sender: Any) {
        Task {
            do {
                let dog = try await apiController.fetchDog()
                let url = URL(string: dog.message)!
                let (data, response) = try await URLSession.shared.data(from: url)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("failed to load image")
                    return
                }
                imageView.image = UIImage(data: data)
            } catch {
                print("Failed to load dog image: \(error.localizedDescription)")
            }
        }
    }
    
}

