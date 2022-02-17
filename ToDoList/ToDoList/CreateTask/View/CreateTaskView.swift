//
//  CreateTaskView.swift
//  ToDoList
//
//  Created by Matheus Villaça on 15/02/22.
//

import UIKit

protocol CreateTaskViewDelegate {
    func createTask(title: String?, description: String)
}

final class CreateTaskView: UIView, ViewCode {
    
    let titleTextField: UITextField = {
        let titleTextField: UITextField = UITextField(frame: .zero)
        titleTextField.borderStyle = .roundedRect
        titleTextField.placeholder = "Título"
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        return titleTextField
    } ()
    
    let descriptionTextView: UITextView = {
        let descriptionTextView: UITextView = UITextView(frame: .zero)
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        return descriptionTextView
    } ()
    
    let confirmButton: UIButton = {
        let confirmButton: UIButton = UIButton(frame: .zero)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.setTitle("CONFIRMAR", for: .normal)
        confirmButton.layer.borderWidth = 0.5
        confirmButton.layer.cornerRadius = 5
        confirmButton.backgroundColor = .systemBlue
        confirmButton.addTarget(self, action: #selector(buttonActionTask), for: .touchUpInside)
        return confirmButton
    } ()
    
    var delegate: CreateTaskViewDelegate
    
    init(delegate: CreateTaskViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy() {
        addSubview(titleTextField)
        addSubview(descriptionTextView)
        addSubview(confirmButton)
    }
    
    func setupConstraints() {
        titleTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        confirmButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 20).isActive = true
        confirmButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        confirmButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
    }
    
    func configureViews() {
        backgroundColor = .white
    }
    @objc func buttonActionTask() {
        delegate.createTask(title: titleTextField.text ?? "", description: descriptionTextView.text)
        
    }
}
