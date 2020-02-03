//
//  LoginViewController.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 03/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var textFieldEmail: UITextField!{
    didSet {
       textFieldEmail.tintColor = UIColor.lightGray
        textFieldEmail.setIcon(UIImage(named: "user")!)
    }
    }
    @IBOutlet weak var textFieldPassword: UITextField! {
        didSet {
            textFieldPassword.tintColor = UIColor.lightGray
            textFieldPassword.setIcon(UIImage(named: "password-1")!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetup()
        textFieldSetup()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    func buttonSetup() {
        buttonLogin.layer.borderWidth = 0.7
        buttonLogin.layer.borderColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        buttonLogin.layer.cornerRadius = 18
    }
    
    func textFieldSetup() {
        textFieldEmail.layer.cornerRadius = 18
        textFieldPassword.layer.cornerRadius = 18
        textFieldEmail.layer.masksToBounds = true
        textFieldPassword.layer.masksToBounds = true
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 89.0/255.0, green: 41.0/255.0, blue: 13.0/255.0, alpha: 1.0).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}
extension UITextField {
func setIcon(_ image: UIImage) {
   let iconView = UIImageView(frame:
                  CGRect(x: 10, y: 5, width: 20, height: 20))
   iconView.image = image
   let iconContainerView: UIView = UIView(frame:
                  CGRect(x: 20, y: 0, width: 30, height: 30))
   iconContainerView.addSubview(iconView)
   leftView = iconContainerView
   leftViewMode = .always
}
}
