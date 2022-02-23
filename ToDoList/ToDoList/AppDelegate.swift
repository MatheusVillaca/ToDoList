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
    var taskListViewController: TasksListViewController?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
        var tasks: [Task] = []
        
        if let savedTasksSearch = UserDefaults.standard.object(forKey: "savedTasks") as? Data,
           let savedTasks: [Task] = try? JSONDecoder().decode([Task].self, from: savedTasksSearch) {
            tasks = savedTasks
        }
        taskListViewController = TasksListViewController(savedTasks: tasks)
        let window: UIWindow = .init(frame: UIScreen.main.bounds)
        window.rootViewController = taskListViewController
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        if let tasksData: Data = try? JSONEncoder().encode(taskListViewController?.tasks) {
            UserDefaults.standard.setValue(tasksData, forKey: "savedTasks")
        }
    }
        
}
