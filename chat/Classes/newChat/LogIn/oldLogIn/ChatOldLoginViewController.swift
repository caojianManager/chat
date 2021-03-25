//
//  ChatOldLoginViewController.swift
//  chat
//
//  Created by jian cao on 2021/3/14.
//

import UIKit



class ChatOldLoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton : UIButton!
    @IBOutlet weak var accountTextField : UITextField!
    @IBOutlet weak var passwordTextField : UITextField!
    @IBOutlet weak var forgetAccountOrPasswordButton : UIButton!
    

    
    var secureTextEntryTogglingButton : UIButton!
    var leftAccountImageView : UIImageView!
    var accountTextFieldLeftView : UIView!
    var leftPasswordImageView : UIImageView!
    var passwordTextFieldLeftView : UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()

        // Do any additional setup after loading the view.
    }
    
    func configView(){
        //config LoginButton
        loginButton.layer.cornerRadius = loginButton.bounds.height / 2
        loginButton.layer.masksToBounds = true
        
        //config accountTextField
        leftAccountImageView = UIImageView(frame: CGRect(x: 10,y: accountTextField.bounds.height/2 - 10,width: 18,height: 18))
        leftAccountImageView.image = UIImage(named: "account_textfield_icon")
        accountTextFieldLeftView =  UIView(frame: CGRect(x: 0, y: 0, width: 36, height: accountTextField.bounds.height))
        accountTextFieldLeftView.addSubview(leftAccountImageView)
        accountTextField.leftView = accountTextFieldLeftView
        accountTextField.leftViewMode = .always
 
        
        //config passwordTextField
        leftPasswordImageView = UIImageView(frame: CGRect(x: 10,y: accountTextField.bounds.height/2 - 10,width: 18,height: 18))
        leftPasswordImageView.image = UIImage(named: "password_textfield_icon")
        passwordTextFieldLeftView = UIView(frame:  CGRect(x: 0, y: 0, width: 36, height: accountTextField.bounds.height))
        passwordTextFieldLeftView.addSubview(leftPasswordImageView)
        passwordTextField.leftView = passwordTextFieldLeftView
        passwordTextField.leftViewMode = .always
    
        
        secureTextEntryTogglingButton = UIButton(frame: CGRect(x: passwordTextField.bounds .width - 35, y: 0, width: 35, height: passwordTextField.bounds.height))
        secureTextEntryTogglingButton.accessibilityLabel = "密码开关"
        secureTextEntryTogglingButton.setImage(UIImage(named: "login_password_visible"), for: .normal)
        secureTextEntryTogglingButton.setImage(UIImage(named: "login_password_invisible"), for: .selected)
        
        secureTextEntryTogglingButton.addTarget(self, action: #selector(toggleSecurityTextEntty), for: .touchUpInside)
        passwordTextField.clearsOnBeginEditing = false
        passwordTextField.rightView = secureTextEntryTogglingButton
        passwordTextField.rightViewMode = .always
        
    
        
    }
    
    @objc func toggleSecurityTextEntty(){
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        secureTextEntryTogglingButton.isSelected = !secureTextEntryTogglingButton.isSelected
        secureTextEntryTogglingButton.accessibilityValue = passwordTextField.isSecureTextEntry ? "显示密码" : "隐藏密码"
       
      
        
    }

    // MARK:- 登录验证
    @IBAction func loginVerify(){
        let chatUserDefaultUtil = ChatUserDefaultUtil()
//        chatUserDefaultUtil.saveUSerDefaultObject(object: accountTextField.text as AnyObject, key: userNameKey)
//        chatUserDefaultUtil.saveUSerDefaultObject(object:passwordTextField.text as AnyObject, key: userPasswordKey)
        
        //test
        let chatMessage = chatMessageViewController()
        chatUserDefaultUtil.saveUSerDefaultObject(object: true as AnyObject, key: autoLoginKey)
        let chatHomeVC = ChatHomeViewController()
        let appDelegate : AppDelegate  = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = chatMessage
        
      
        
        
        
    }
    


}
