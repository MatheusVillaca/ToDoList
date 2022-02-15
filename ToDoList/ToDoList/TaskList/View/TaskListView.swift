//
//  TaskListView.swift
//  ToDoList
//
//  Created by Matheus Villaça on 15/02/22.
//

import UIKit

final class TaskListView: UIView, UITableViewDataSource {
    
    let addButton: UIButton = {
        let addButton: UIButton = UIButton (frame: .zero)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("Adicionar Tarefa", for: .normal)
        return addButton
    }()
    
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView (frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
