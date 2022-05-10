//
//  AppDelegate.swift
//  Live
//
//  Created by gaoshuang on 2022/2/10.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = TabBarController()
        self.window?.makeKeyAndVisible()
        
        LocalizationTool.shared.checkLanguage()
        LocalizationTool.shared.setLanguage(language: Language.english)
        let cancel = "Cancel".localized
        let ok = "OK".localized
        NSLog(cancel)
        NSLog(ok)
        // Override point for customization after application launch.
        return true
    }

}

