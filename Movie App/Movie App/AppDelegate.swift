//
//  AppDelegate.swift
//  Movie App
//
//  Created by BJIT on 8/12/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: MainViewController())
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window

        return true
    }


}

