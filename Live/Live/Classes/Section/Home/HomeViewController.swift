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
        
        let vc = LoginViewController();
        vc.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(vc, animated: false)
        self.initView()
        
        //        let nav = NavigationController.init(rootViewController: LoginViewController())
        //        let window = UIApplication.shared.delegate!.window
        //        window??.rootViewController = nav
        //        window??.makeKeyAndVisible()
        
        //        self.navigationController?.hidesBottomBarWhenPushed = false
        
//        let button = UIButton(frame:CGRect(x:20, y:200, width:130, height:50))
//        button.setTitle("这个是一段 very 长的文字", for:.normal) //普通状态下的文字
//        button.setTitleColor(UIColor.white, for: .normal) //普通状态下文字的颜色
//        button.backgroundColor = UIColor.orange
//        self.view.addSubview(button)
//        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
    }
    func initView(){
        
    }
    @objc func buttonClick ()  {
        let vc = LoginViewController();
        vc.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(vc, animated: true)
  
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


