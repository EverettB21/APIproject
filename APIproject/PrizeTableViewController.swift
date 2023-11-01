//
//  PrizeTableViewController.swift
//  APIproject
//
//  Created by Everett Brothers on 10/25/23.
//

import UIKit

class PrizeTableViewController: UITableViewController {

    var prizes: [Prize] = []
    
    let apiController = ApiController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                let resultPrizes = try await apiController.fetchPrizes()
                DispatchQueue.main.async {
                    self.prizes = resultPrizes
                    self.tableView.reloadData()
                }
            } catch {
                print("Error getting prizes: \(error.localizedDescription)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prize", for: indexPath)
        configure(cell, for: indexPath)
        
        return cell
    }
    
    func configure(_ cell: UITableViewCell, for indexPath: IndexPath) {
        let prize = prizes[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = prize.category?.capitalized ?? "Prize"
        cell.contentConfiguration = content
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PersonTableViewController, let cell = sender as? UITableViewCell {
            vc.people = prizes[tableView.indexPath(for: cell)!.row].laureates!
            vc.catergory = prizes[tableView.indexPath(for: cell)!.row].category!
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toPeople", sender: tableView.cellForRow(at: indexPath))
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        while prizes.count > 6 {
            prizes.removeLast()
        }
        return prizes.count
    }

}
