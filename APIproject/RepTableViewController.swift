//
//  RepTableViewController.swift
//  APIproject
//
//  Created by Everett Brothers on 10/25/23.
//

import UIKit

class RepTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var reps: [Rep] = []
    var apiConroller = ApiController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func fetchMatchingItems() {
        self.reps = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text ?? ""
        
        guard searchTerm.count == 5, let _ = Int(searchTerm) else {
            print("invalid zip")
            return
        }
        
        if !searchTerm.isEmpty {
            let queryItems = [
                "zip": searchTerm,
                "output": "json"
            ].map { URLQueryItem(name: $0.key, value: $0.value) }
            
            Task {
                do {
                    let resultReps = try await apiConroller.fetchReps(matching: queryItems)
                    DispatchQueue.main.async {
                        self.reps = resultReps
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Error with reps: \(error.localizedDescription)")
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reps.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rep", for: indexPath)
        configure(cell, for: indexPath)
        
        return cell
    }
    
    func configure(_ cell: UITableViewCell, for indexPath: IndexPath) {
        let rep = reps[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = rep.name
        content.secondaryText = rep.party
        cell.contentConfiguration = content
    }
    
}

extension RepTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
}
