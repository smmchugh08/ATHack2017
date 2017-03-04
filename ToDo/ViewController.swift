//
//  ViewController.swift
//  ToDo
//
//  Created by Stephanie McHugh on 3/4/17.
//  Copyright © 2017 Team John. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var toDoItems = [ToDoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        if toDoItems.count > 0 {
            return
        }
        
        toDoItems.append(ToDoItem(text: "Make the bed"))
        toDoItems.append(ToDoItem(text: "Brush your teeth"))
        toDoItems.append(ToDoItem(text: "Set the kitchen table"))
        toDoItems.append(ToDoItem(text: "Take out the trash"))
    }

    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        let item = toDoItems[indexPath.row]
        cell.textLabel?.text = item.text
        return cell
    }
}

