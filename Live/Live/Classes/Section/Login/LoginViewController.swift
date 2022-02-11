//
//  LoginViewController.swift
//  Live
//
//  Created by gaoshuang on 2022/2/11.
//

import UIKit

class LoginViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        var textView:UITextView = {
            let textView = UITextView.init();
            view.addSubview(textView)
            textView.clipsToBounds = true
            textView.tex
//               textView.textColor = UIColor.orange
//               textView.layer.cornerRadius = 10
//               textView.layer.borderWidth = 1.0
//               textView.layer.borderColor = UIColor.gray.cgColor
               textView.font = UIFont.systemFont(ofSize: 17)
            textView.snp.makeConstraints { make in
                make.left.equalTo(imageViewPhone.snp_rightMargin).offset(10);
                make.centerY.equalTo(imageViewPhone);
                make.size.equalTo(CGSize(width: kScreenW-80 ,height: 39))

            }
            return textView
        
        // Do any additional setup after loading the view.
        }()
        
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
