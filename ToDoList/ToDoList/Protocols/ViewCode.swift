//
//  ViewCode.swift
//  ToDoList
//
//  Created by Matheus Villaça on 15/02/22.
//

import Foundation

protocol ViewCode {
    func setupView()
    func setupViewHierarchy()
    func setupConstraints()
    func configureViews()
}
extension ViewCode {
    func setupView() {
        setupViewHierarchy()
        setupConstraints()
        configureViews()
        setupView()
    }
}
