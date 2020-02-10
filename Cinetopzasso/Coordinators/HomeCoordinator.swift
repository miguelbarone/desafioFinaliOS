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
    var controller: HomeController
    var view: UIViewController?
    var navigation: UINavigationController?
    
    init(delegate: HomeCoordinatorDelegate) {
        self.delegate = delegate
        controller = HomeController(delegate: nil, service: MoviesService())
        controller.set(delegateHome: self)
    }
    
    func start() {
        let view = HomeViewController(controller: controller)
        view.delegate = self
        navigation = UINavigationController(rootViewController: view)
        navigation?.isNavigationBarHidden = true
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

extension HomeCoordinator: HomeControllerDelegate {
    func didSelecetItem(_ movies: Movie) {
        let controller = DetailsController(movies: movies)
        view = DetailsViewController(controller: controller)
        navigation?.pushViewController(view!, animated: true)
    }
    
    
}

