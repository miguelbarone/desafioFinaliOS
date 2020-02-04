//
//  HomeCoordinator.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 04/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//


import UIKit

protocol HomeCoordinatorDelegate {
    func didRequestLogout()
}

class HomeCoordinator: BaseCoordinator {
    var rootViewController: UINavigationController?
    let delegate: HomeCoordinatorDelegate
    
    init(delegate: HomeCoordinatorDelegate) {
        self.delegate = delegate
    }
    
    func start() {
        let view = HomeViewController()
        view.delegate = self
        let navigation = UINavigationController(rootViewController: view)
        navigation.isNavigationBarHidden = true
        rootViewController = navigation
    }
    
    func finish() {
        
    }
}

extension HomeCoordinator: HomeScreenViewControllerDelegate {
    
    func didTouchLogout() {
        delegate.didRequestLogout()
    }
}

