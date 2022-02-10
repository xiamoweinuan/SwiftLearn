//
//  TabBarController.swift
//  Live
//
//  Created by gaoshuang on 2022/2/10.
//

import UIKit
import ESTabBarController_swift
class TabBarController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customIrregularityStyle(delegate: self as? UITabBarControllerDelegate)
        
        
        // Do any additional setup after loading the view.
    }
 
    //加载底部tabbar样式
    func customIrregularityStyle(delegate: UITabBarControllerDelegate?) -> ESTabBarController {
        let tabBarController = self
        //是否需要劫持事件
        tabBarController.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        //劫持事件触发
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
//        let v1 = NavigationController.init(rootViewController:  HomeViewController())
//        let v2 = NavigationController.init(rootViewController:  HomeViewController())
//        let v3 = NavigationController.init(rootViewController:  HomeViewController())
//        let v4 = NavigationController.init(rootViewController:  HomeViewController())
//        let v5 = NavigationController.init(rootViewController:  HomeViewController())
//        v1.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Home", image: UIImage(named: "tab_home1"), selectedImage: UIImage(named: "tab_home2"))
//        v2.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Home", image: UIImage(named: "tab_gaunzhu1"), selectedImage: UIImage(named: "tab_gaunzhu2"))
//        v3.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: "", image: UIImage(named: "tab_home2"), selectedImage: UIImage(named: "tab_home2"))
//        v4.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Home", image: UIImage(named: "tab_acti1"), selectedImage: UIImage(named: "tab_acti2"))
//        v5.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "Home", image: UIImage(named: "tab_mine1"), selectedImage: UIImage(named: "tab_mine2"))
//
//        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
//        setUpChildController(HomeViewController(), "home", "tab_home1", "tab_home2")
//        setUpChildController(HomeViewController(), "home", "tab_home1", "tab_home2")
//        setUpChildController(HomeViewController(), "home", "tab_home1", "tab_home2")
//        setUpChildController(HomeViewController(), "home", "tab_home1", "tab_home2")
//        setUpChildController(HomeViewController(), "home", "tab_home1", "tab_home2")
//        setUpChildController(HomeViewController(), "home", "tab_home1", "tab_home2")

        addChildControllers([HomeViewController(),HomeViewController(),HomeViewController(),HomeViewController()],
                              ["home","foucs","find","mine"],
                              ["tab_home1","tab_gaunzhu1","tab_acti1","tab_mine1"],
                              ["tab_home2","tab_gaunzhu2","tab_acti2", "tab_mine2"],
                                "tab_home2" )
        
        return self;
    }
    private func addChildControllers(_ controllers: [UIViewController],_ titles:[String],_ images:[String],_ selectedImages:[String],_ centerImage:String){
        for i in stride(from: 0, to: controllers.count ,by: 1) {
            
            let nav = NavigationController.init(rootViewController:  controllers[i]);
            //添加中心按钮
            if (!centerImage.jk.isBlank && i==2){
                addCenterView(centerImage)
            }
            
            //设置第一个tab选中状态
            let contentView =   ExampleBouncesContentView();
            if (i==0 ){
                contentView.selected = true
            }
            
            nav.tabBarItem =  ESTabBarItem.init(contentView, title: titles[i], image: UIImage(named: images[i]), selectedImage: UIImage(named: selectedImages[i]));
            
            nav.title = title;
            self.addChild(nav)
            
        }


    }
    private func addCenterView(_ image:String){
        let nav = NavigationController.init(rootViewController:  UIViewController());
    
        nav.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: "", image: UIImage(named: image), selectedImage: UIImage(named: image))
        self.addChild(nav)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
