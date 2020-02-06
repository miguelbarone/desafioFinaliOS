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
    var initialViewController: SplashViewController
    var loginCoordinator: LoginCoordinator?
    var homeCoordinator: HomeCoordinator?
    
    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.initialViewController = SplashViewController.instantiate()
    }
    
    func start() {
        self.initialViewController.delegate = self
        self.window.rootViewController = initialViewController
        self.window.makeKeyAndVisible()
    }
    
    func finish() {
        
    }
    
    func showLogin() {
        loginCoordinator = loginCoordinator ?? LoginCoordinator(delegate: self, securityService: SecurityService())
        loginCoordinator?.start()
        
        self.window.rootViewController = self.loginCoordinator?.rootViewController!
        
    }
    
    func showHome() {
        homeCoordinator = homeCoordinator ?? HomeCoordinator(delegate: self)
        homeCoordinator?.start()
        self.window.rootViewController = homeCoordinator?.rootViewController
        
    }
    }

extension AppCoordinator: SplashViewDelegate {
    func didFinishLoading() {
        let securityService: SecurityService = SecurityService()
        
        if securityService.currentUser != nil {
            showHome()
        } else {
            showLogin()
        }
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
