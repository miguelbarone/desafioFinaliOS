//
//  LoginController.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 04/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation

protocol LoginControllerDelegate: class {
    func didLoginSuccess(email: String, password:String)
    func didForgotPassward()
}

protocol LoginControllerContract {
    func validateLogin()
    func login(email: String, password: String)
    func forgotPassword()
    func register()
}


class LoginController: LoginControllerContract {
    private var securityService: SecurityServiceContract
    private weak var viewController: LoginViewController?
    
    init(viewController: LoginViewController, securityService: SecurityServiceContract) {
        self.viewController = viewController
        self.securityService = securityService
    }
    
    func validateLogin() {
        guard securityService.currentUser != nil else { return }
        
    }
    
    func login(email: String, password: String) {
        securityService.login(email: email, password: password)
        self.viewController?.viewDelegate?.userDidLoginWithSuccess()
        
    }
    
    func forgotPassword() {
        goToForgotPassword()
        
    }
    
    func register() {
        goToRegisterScreen()
    }
    
    
    private func goToForgotPassword() {
        guard let vc = self.viewController else { return }
        
        let viewController = ForgotPasswordViewController(nibName: "ForgotPasswordViewController", bundle: nil)
        viewController.modalPresentationStyle = .popover
        
        vc.present(viewController, animated: true, completion: nil)
    }
    
    private func goToRegisterScreen() {
        guard let vc = self.viewController else { return }
        
        let viewController = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        viewController.modalPresentationStyle = .popover
        
        vc.present(viewController, animated: true, completion: nil)
    }
}


