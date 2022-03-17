//
//  TaskListViewCell.swift
//  ToDoList
//
//  Created by Matheus Villaça on 17/02/22.
//

import UIKit

protocol TaskListViewCellDelegate {
    func doneAction(index: Int)
}

final class TaskListViewCell: UITableViewCell, ViewCode {
    
    var index: Int = 0
    
    var titleTaskLabel: UILabel = {
        let titleTaskLabel: UILabel = UILabel(frame: .zero)
        titleTaskLabel.font = titleTaskLabel.font.withSize(15)
        titleTaskLabel.textColor = .black
        titleTaskLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleTaskLabel
    } ()
    
    var descriptionTaskLabel: UILabel = {
        let descriptionTaskLabel: UILabel = UILabel(frame: .zero)
        descriptionTaskLabel.font = descriptionTaskLabel.font.withSize(10)
        descriptionTaskLabel.textColor = .black
        descriptionTaskLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTaskLabel.numberOfLines = 0
        return descriptionTaskLabel
    } ()
    
    let taskDoneButton: UIButton = {
        let taskDoneButton: UIButton = UIButton(frame: .zero)
        taskDoneButton.setTitle("Done!", for: .normal)
        taskDoneButton.backgroundColor = .systemBlue
        taskDoneButton.layer.borderColor = UIColor.black.cgColor
        taskDoneButton.layer.borderWidth = 0.5
        taskDoneButton.layer.cornerRadius = 4
        taskDoneButton.translatesAutoresizingMaskIntoConstraints = false
        taskDoneButton.isUserInteractionEnabled = true
        return taskDoneButton
    } ()
    
    @objc func didTapDoneButton() {
        delegate?.doneAction(index: index)
    }
    
    var delegate: TaskListViewCellDelegate?
    
    func setupCell(titleTask: String, descriptionTask: String, delegate: TaskListViewCellDelegate, index: Int, isExpanded: Bool) {
        self.delegate = delegate
        self.index = index
        self.titleTaskLabel.text = titleTask
        self.descriptionTaskLabel.text = descriptionTask
        self.descriptionTaskLabel.numberOfLines = isExpanded ? 0 : 1
        setupView()
    }
    
    func setupViewHierarchy() {
        contentView.addSubview(titleTaskLabel)
        contentView.addSubview(descriptionTaskLabel)
        contentView.addSubview(taskDoneButton)
    }
    
    func setupConstraints() {
        
        titleTaskLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        titleTaskLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        
        taskDoneButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        taskDoneButton.leadingAnchor.constraint(equalTo: titleTaskLabel.trailingAnchor, constant: -10).isActive = true
        taskDoneButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        taskDoneButton.bottomAnchor.constraint(equalTo: descriptionTaskLabel.topAnchor, constant: 5).isActive = true
        taskDoneButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        descriptionTaskLabel.topAnchor.constraint(equalTo: titleTaskLabel.bottomAnchor, constant: 5).isActive = true
        descriptionTaskLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        descriptionTaskLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        descriptionTaskLabel.trailingAnchor.constraint(equalTo: taskDoneButton.leadingAnchor, constant: -10).isActive = true
    }
    
    func configureViews() {
        backgroundColor = .white
        selectionStyle = .none
        taskDoneButton.addTarget(self, action: #selector(didTapDoneButton), for: .touchUpInside)
    }
    
}
