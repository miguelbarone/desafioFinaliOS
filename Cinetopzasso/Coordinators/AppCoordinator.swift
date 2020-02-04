//
//  AppCoordinator.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 04/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    var window: UIWindow
    var initialViewController: UIViewController
    var loginCoordinator: LoginCoordinator?
    var homeCoordinator: HomeCoordinator?
    
    init() {
        self.window = UIWindow()
        self.initialViewController = SplashViewController.instantiate()
        
        self.window.rootViewController = initialViewController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        
        showLogin()
    }
    
    func finish() {
        
    }
    
        func showLogin() {
            loginCoordinator = loginCoordinator ?? LoginCoordinator(delegate: self, securityService: SecurityService())
            loginCoordinator?.start()
            
            self.window.rootViewController = loginCoordinator?.rootViewController!
        }
        
        func showHome() {
            homeCoordinator = homeCoordinator ?? HomeCoordinator(delegate: self)
            homeCoordinator?.start()
            self.window.rootViewController = homeCoordinator?.rootViewController
        }
    }

    extension AppCoordinator: LoginCoordinatorDelegate {
        func didLoginWithSuccess() {
            loginCoordinator?.finish()
            showHome()
        }
    }

    extension AppCoordinator: HomeCoordinatorDelegate {
        func didRequestLogout() {
            homeCoordinator?.finish()
            showLogin()
        }
    }
