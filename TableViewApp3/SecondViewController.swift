//
//  SecondViewController.swift
//  TableViewApp3
//
//  Created by Haider on 24/10/2024.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var yourData : [String:String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        dataLabel.text = "\(yourData["name"]!)\n\n\n\(yourData["room"]!)\n\n\n\n\n\(yourData["email"]!)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
