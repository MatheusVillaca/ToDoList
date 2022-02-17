//
//  AppDelegate.swift
//  ToDoList
//
//  Created by Matheus Villaça on 15/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let savedTasksData: Data = UserDefaults.standard.data(forKey: "savedTasks") {}
        let window: UIWindow = .init(frame: UIScreen.main.bounds)
        window.rootViewController = TasksListViewController(savedTasks: )
        self.window = window
        window.makeKeyAndVisible()
        
        return true
    }

}

