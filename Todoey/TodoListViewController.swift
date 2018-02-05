//
//  ViewController.swift
//  Todoey
//
//  Created by Sukhman Kaur on 2/5/18.
//  Copyright © 2018 Jaskaran Singh. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgan"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }

//   Mark - Tableview Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    
    }
    
//    Mark - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//      print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        
        }  else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    
    }
    
//    MARK - Add New Items""

    
    @IBAction func addButtenPressed(_ sender: UIBarButtonItem) {
    
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
//            What will happen once the user clicks the add item button on out UIalert
            
        self.itemArray.append(textField.text!)
            
        self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

}

    



