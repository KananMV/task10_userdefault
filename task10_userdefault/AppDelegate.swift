//
//  AppDelegate.swift
//  task10_userdefault
//
//  Created by Kenan Memmedov on 08.09.24.
//

import UIKit

@main
    class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame:  UIScreen.main.bounds)
        let vc = ViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
//        UserDefaults.standard.removeObject(forKey: "sumsave")
//        UserDefaults.standard.synchronize()
        return true
    }

}

