//
//  AppDelegate.swift
//  my to do list
//
//  Created by Mahbubur Rashid Leon on 29/5/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupDefaultNavigationBarStyle()
        setupEntryPoint()
        return true
    }
}


extension AppDelegate {
    func setupDefaultNavigationBarStyle() {
        UINavigationBar.appearance().titleTextAttributes = [
            .font: UIFont(name: "Avenir Next Medium", size: 20)!
        ]
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font: UIFont(name: "Avenir Next Bold", size: 30)!
        ]
    }
    
    func setupEntryPoint() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}
