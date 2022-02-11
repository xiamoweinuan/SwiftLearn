//
//  HomeViewController.swift
//  Live
//
//  Created by gaoshuang on 2022/2/10.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "home"

        self.view.backgroundColor = UIColor.white;
        
        let nav = NavigationController.init(rootViewController: LoginViewController())
        let window = UIApplication.shared.delegate!.window
        window??.rootViewController = nav
        window??.makeKeyAndVisible()

//        self.navigationController!.pushViewController(LoginViewController(), animated: true)
        
        
//        let button = UIButton(frame:CGRect(x:20, y:50, width:130, height:50))
//        button.setTitle("这个是一段 very 长的文字", for:.normal) //普通状态下的文字
//        button.setTitleColor(UIColor.white, for: .normal) //普通状态下文字的颜色
//        button.backgroundColor = UIColor.orange
//        self.view.addSubview(button)
        // Do any additional setup after loading the view.
    }
//    func button{
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
