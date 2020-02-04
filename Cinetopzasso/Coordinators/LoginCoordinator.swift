//
//  LoginCoordinator.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 04/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

protocol LoginCoordinatorDelegate {
    func didLoginWithSuccess()
}

class LoginCoordinator: BaseCoordinator {
    
    
    var rootViewController: UIViewController?
    private let securityService: SecurityServiceContract
    private let delegate: LoginCoordinatorDelegate
    
    init(delegate: LoginCoordinatorDelegate, securityService: SecurityServiceContract) {
        self.delegate = delegate
        self.securityService = securityService
    }
    
    func start() {
        let view = LoginViewController.instantiate(controller: nil, viewDelegate: self)
        view.controller = LoginController(viewController: view, securityService: securityService)
        
        let navigation = UINavigationController(rootViewController: view)
        navigation.isNavigationBarHidden = true
        self.rootViewController = navigation
    }
    
    func finish() {
        rootViewController = nil
    }
    
    
}

extension LoginCoordinator: LoginScreenDelegate {
    func userDidLoginWithSuccess() {
        delegate.didLoginWithSuccess()
    }
}
    
