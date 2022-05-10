//
//  LoginViewController.swift
//  Live
//
//  Created by gaoshuang on 2022/2/11.
//

import UIKit
import Accelerate
import JKSwiftExtension

class LoginViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        self.title = "登录"
        let  disLeft = 30;
        var imageViewPhone = UIImageView.zj_createImageView(imageName: "login_phone", supView: view) { make in
            make.left.equalTo(self.view).offset(disLeft);
            make.top.equalTo(self.view).offset(kScreenH/2-100);
            make.size.equalTo(CGSize(width: 25,height: 25))
            
        }
        
        UIView.zj_createImageView(imageName: "common_icon", contentMode: UIView.ContentMode.scaleAspectFit, supView: self.view) { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(imageViewPhone.snp_topMargin).offset(-60);
            make.size.equalTo(CGSize(width: 100,height: 100))
        }
        
        
        var textFieldPhone =   UIView.zj_createTextField(text: "", textColor: UIColor.orange, placeholder: "请输入手机号", font: FontSize(16), textAlignment: NSTextAlignment.left, borderStyle: UITextField.BorderStyle.none, supView: self.view) { make in
            make.left.equalTo(imageViewPhone.snp_rightMargin).offset(10);
            make.centerY.equalTo(imageViewPhone);
            make.size.equalTo(CGSize(width: kScreenW-80 ,height: 39))
        }
        
        UIView.zj_createView(bgClor: klineColor, supView: self.view) { make in
            make.left.equalTo(imageViewPhone.snp_leftMargin).offset(20);
            make.right.equalTo(textFieldPhone.snp_rightMargin);
            make.height.equalTo(1);
            make.top.equalTo(textFieldPhone.snp_bottomMargin).offset(3);
        }
        
        
        
        
        
        
        var imageViewPwd = UIImageView.zj_createImageView(imageName: "login_pwd", supView: view) { make in
            make.left.equalTo(self.view).offset(disLeft);
            make.top.equalTo(self.view).offset(kScreenH/2-100+70);
            make.size.equalTo(CGSize(width: 25,height: 25))
            
        }
        
        
        var textFieldPwd =   UIView.zj_createTextField(text: "", textColor: UIColor.orange, placeholder: "请输入密码", font: FontSize(16), textAlignment: NSTextAlignment.left, borderStyle: UITextField.BorderStyle.none, supView: self.view) { make in
            make.left.equalTo(imageViewPwd.snp_rightMargin).offset(10);
            make.centerY.equalTo(imageViewPwd);
            make.size.equalTo(CGSize(width: kScreenW-80 ,height: 39))
        }
        
        UIView.zj_createView(bgClor: klineColor, supView: self.view) { make in
            make.left.equalTo(imageViewPwd.snp_leftMargin).offset(20);
            make.right.equalTo(textFieldPwd.snp_rightMargin);
            make.height.equalTo(1);
            make.top.equalTo(textFieldPwd.snp_bottomMargin).offset(6);
        }
        let button1  =  JKPOP.normal();
        
        button1.addTo(self.view).title("登陆", UIControl.State.normal).snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20);
            make.right.equalToSuperview().offset(-20);
            make.bottom.equalToSuperview().offset(-160);
            make.height.equalTo(45);
        }
        button1.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
        
        
    }
    @objc func buttonClick ()  {
        print("你点击了我这个按钮方法buttonClick1");
       
        self.navigationController!.popViewController(animated: true)
        
//        UIApplication.shared.delegate?.window?.subviews.makeObjectsPerform(#selector(UIView.removeFromSuperview))
    
//        [[UIApplication sharedApplication].delegate.window.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//        let vc = TabBarController()
//        let window = UIApplication.shared.delegate!.window
//        window??.rootViewController = vc
//        window??.makeKeyAndVisible()

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
