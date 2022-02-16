//
//  TaskListView.swift
//  ToDoList
//
//  Created by Matheus Villaça on 15/02/22.
//

import UIKit

final class TaskListView: UIView, UITableViewDataSource, ViewCode {
    
    let addButton: UIButton = {
        let addButton: UIButton = UIButton (frame: .zero)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("Adicionar Tarefa", for: .normal)
        addButton.backgroundColor = .systemBlue
        addButton.addTarget(self, action: #selector(addTaskAction), for: .touchUpInside)
        return addButton
    }()
    
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView (frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        return tableView
    }()
    
    let addAction: (() -> Void)
    
    init(addAction: @escaping (() -> Void)){
        self.addAction = addAction
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
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

}
