//
//  PersonTableViewController.swift
//  APIproject
//
//  Created by Everett Brothers on 10/25/23.
//

import UIKit

class PersonTableViewController: UITableViewController {

    var people: [Laureates] = []
    var catergory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "person", for: indexPath)
        configure(cell, for: indexPath)
        
        return cell
    }
    
    func configure(_ cell: UITableViewCell, for indexPath: IndexPath) {
        let person = people[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = "\(person.surname!), \(person.firstname!)"
        content.secondaryText = catergory.capitalized
        cell.contentConfiguration = content
    }
    
}
