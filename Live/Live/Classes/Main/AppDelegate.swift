//
//  AppDelegate.swift
//  Live
//
//  Created by gaoshuang on 2022/2/10.
//

import UIKit
import ESTabBarController_swift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tab = self.customIrregularityStyle(delegate: self as? UITabBarControllerDelegate)
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = tab
        self.window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }
    //加载底部tabbar样式
    func customIrregularityStyle(delegate: UITabBarControllerDelegate?) -> NavigationController {
        let tabBarController = ESTabBarController()
        
        tabBarController.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        tabBarController.didHijackHandler = {
            [weak tabBarController] tabbarController, viewController, index in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
                let takePhotoAction = UIAlertAction(title: "Take a photo", style: .default, handler: nil)
                alertController.addAction(takePhotoAction)
                let selectFromAlbumAction = UIAlertAction(title: "Select from album", style: .default, handler: nil)
                alertController.addAction(selectFromAlbumAction)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                tabBarController?.present(alertController, animated: true, completion: nil)
            }
        }
        let v1 = HomeViewController()
        let v2 = HomeViewController()
        let v3 = HomeViewController()
        let v4 = HomeViewController()
        let v5 = HomeViewController()
        v1.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Home", image: UIImage(named: "tab_home1"), selectedImage: UIImage(named: "tab_home2"))
        v2.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Home", image: UIImage(named: "tab_gaunzhu1"), selectedImage: UIImage(named: "tab_gaunzhu2"))
        v3.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: "Home", image: UIImage(named: "photo_verybig"), selectedImage: UIImage(named: "photo_verybig"))
        v4.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Home", image: UIImage(named: "tab_acti1"), selectedImage: UIImage(named: "tab_acti2"))
        v5.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Home", image: UIImage(named: "tab_mine1"), selectedImage: UIImage(named: "tab_mine2"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        let navigationController = NavigationController.init(rootViewController: tabBarController)
        tabBarController.title = "Example"
        return navigationController
    }




}

