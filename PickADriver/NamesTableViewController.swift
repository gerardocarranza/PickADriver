//
//  NamesTableViewController.swift
//  PickADriver
//
//  Created by Gerardo Carranza on 11/12/19.
//  Copyright © 2019 Gerardo Carranza. All rights reserved.
//

import UIKit

class NamesTableViewController: UITableViewController {

    var period = String()
    var defaults = UserDefaults.standard
    var names = [String]() {
        didSet {
            defaults.set(names, forKey: period)
        }
    }
    
    //var names = ["Riley", "Mason", "Jaylin", "Josh", "Gerardo", "David", "Fitzer", "Kelvin"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        defaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
//        defaults.synchronize()
        if let savedData = defaults.object(forKey: period) as? [String] {
            names = savedData
        } else {
            loadTestNames()
        }
        tableView.isEditing = true
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return names.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
 

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let nameToMove = names.remove(at: fromIndexPath.row)
        names.insert(nameToMove, at: to.row)
    }
 

 
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
 

    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
    

    
    @IBAction func onPlusButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add a name", message: "test", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        let appendAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            let nameTextField = alert.textFields![0] as UITextField
            let name = nameTextField.text!
            self.names.append(name)
            self.tableView.reloadData()
        }
        alert.addAction(appendAction)
        present(alert, animated: true, completion: nil)
    }
    
    func loadTestNames(){
        switch period {
        case "First Period":
            names = ["Steve", "Bob", "Jim"]
        case "Second Period":
            names = ["Shrek", "Donkey", "Fiona"]
        case "Third Period":
            names = ["Homer", "Lisa", "Bart"]
        case "Fourth Period":
            names = ["Wil", "Pedro", "Federico"]
        case "Fifth Period":
            names = ["Jaden", "Marcus", "Jamie"]
        case "Sixth Period":
            names = ["Luis", "Juan", "Angel"]
        case "Seventh Period":
            names = ["Pierre", "Alexandre", "Mesut"]
        case "Eighth Period":
            names = ["Javier", "Hector", "Fernando"]
        default:
            names = ["Error: Couldn't load names"]
        }
    }
    
}
