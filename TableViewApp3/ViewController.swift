//
//  ViewController.swift
//  TableViewApp3
//
//  Created by Haider on 24/10/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var yourDataArray = [
        ["name": "Phil", "room": "A1.20", "email": "phil@liverpool.ac.uk"],
        ["name": "Terry", "room": "A2.18", "email": "trp@liverpool.ac.uk"],
        ["name": "Valli", "room": "A2.12", "email": "V.Tamma@liverpool.ac.uk"],
        ["name": "Boris", "room": "A1.15", "email": "Konev@liverpool.ac.uk"]
    ]
    var yourDataToPass : [String: String]!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yourDataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Extract the dictionary for the current row
        let person = yourDataArray[indexPath.row]
        
        // Display the person's name in the textLabel
        cell.textLabel?.text = person["name"]
        
        // Optional: you can also customize the detailTextLabel if you want to show more info
        cell.detailTextLabel?.text = person["email"] // Or room, etc.
        
        // Add disclosure indicator
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the data from your data source
            yourDataArray.remove(at: indexPath.row)
            // Update the table view
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        yourDataToPass = yourDataArray[indexPath.row]
        performSegue(withIdentifier: "secondView", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.isEditing = true
        self.navigationController?.navigationBar.isHidden = true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondView" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.yourData = yourDataToPass
        }
    }
    @IBAction func unwindToFirstViewController(segue: UIStoryboardSegue) {
        // Any additional logic when returning to this view controller.
        print("Returned to First View Controller")
    }
}

