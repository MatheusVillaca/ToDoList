//
//  TaskListView.swift
//  ToDoList
//
//  Created by Matheus Villaça on 15/02/22.
//

import UIKit

final class TaskListView: UIView, ViewCode {
    
    let addButton: UIButton = {
        let addButton: UIButton = UIButton (frame: .zero)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("Adicionar Tarefa", for: .normal)
        addButton.layer.borderWidth = 0.5
        addButton.layer.cornerRadius = 5
        addButton.backgroundColor = .systemBlue
        addButton.addTarget(self, action: #selector(addTaskAction), for: .touchUpInside)
        return addButton
    }()
    
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView (frame: .zero)
        tableView.register(TaskListViewCell.self, forCellReuseIdentifier: "taskCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let addAction: (() -> Void)
    
    init(tableViewDelegate: UITableViewDelegate, dataSource: UITableViewDataSource, addAction: @escaping (() -> Void)){
        self.addAction = addAction
        super.init(frame: .zero)
        tableView.dataSource = dataSource
        tableView.delegate = tableViewDelegate
        setupView()
    }
  
    func setupViewHierarchy() {
        addSubview(addButton)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        tableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func configureViews() {
        backgroundColor = .white
    }
    
    @objc func addTaskAction() {
        addAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
