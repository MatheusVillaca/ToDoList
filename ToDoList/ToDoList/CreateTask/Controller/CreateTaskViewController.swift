//
//  CreateTaskViewController.swift
//  ToDoList
//
//  Created by Matheus Villaça on 15/02/22.
//

import UIKit

final class CreateTaskViewController: UIViewController {
    
    lazy var createView: CreateTaskView = .init()
    
    override func loadView() {
        view = createView
    }
}
