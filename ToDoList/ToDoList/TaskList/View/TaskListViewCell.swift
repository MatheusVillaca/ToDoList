//
//  TaskListViewCell.swift
//  ToDoList
//
//  Created by Matheus Villaça on 17/02/22.
//

import UIKit

final class TaskListViewCell: UITableViewCell, ViewCode {
    
    var titleTaskLabel: UILabel = {
        let titleTaskLabel: UILabel = UILabel(frame: .zero)
        titleTaskLabel.font = titleTaskLabel.font.withSize(20)
        titleTaskLabel.textColor = .black
        titleTaskLabel.textAlignment = .center
        titleTaskLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleTaskLabel
    } ()
    
    var descriptionTaskLabel: UILabel = {
        let descriptionTaskLabel: UILabel = UILabel(frame: .zero)
        descriptionTaskLabel.font = descriptionTaskLabel.font.withSize(15)
        descriptionTaskLabel.textColor = .black
        descriptionTaskLabel.numberOfLines = 0
        descriptionTaskLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionTaskLabel
    } ()
    
    let stackView: UIStackView = {
        let stackView: UIStackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    
    func setupCell(titleTask: String, descriptionTask: String) {
        self.titleTaskLabel.text = titleTask
        self.descriptionTaskLabel.text = descriptionTask
        setupView()
    }
    
    func setupViewHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleTaskLabel)
        stackView.addArrangedSubview(descriptionTaskLabel)
    }
    
    func setupConstraints() {
        
        stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func configureViews() {
        backgroundColor = .white
    }
    
}
