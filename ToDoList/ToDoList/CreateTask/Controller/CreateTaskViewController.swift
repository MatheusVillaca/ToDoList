//
//  CreateTaskViewController.swift
//  ToDoList
//
//  Created by Matheus Villaça on 15/02/22.
//

import UIKit

final class CreateTaskViewController: UIViewController {
    
    var createView: CreateTaskView
    
    override func loadView() {
        view = createView
    }
    
    init(delegate: CreateTaskViewDelegate) {
        createView = .init(delegate: delegate)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
