//
//  AppDelegate.swift
//  Contacts
//
//  Created by Petro Golishevskiy on 01.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        let key = "startСounter"
        let counter = UserDefaults.standard
        let oldValue = counter.integer(forKey: key)
        print(counter.synchronize())
        print("oldValue - \(oldValue)")
        
        counter.setValue(oldValue + 1, forKey: key)
        print(counter.synchronize())
        print("newValue - \(counter.integer(forKey: key))")
        
        if counter.integer(forKey: key) % 3 == 0 {
            print("Alert")
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

