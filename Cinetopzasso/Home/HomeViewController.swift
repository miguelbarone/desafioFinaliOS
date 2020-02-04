//
//  HomeViewController.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 04/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

protocol HomeScreenViewControllerDelegate: class {
    func didTouchLogout()
}

class HomeViewController: UIViewController {
    
    weak var delegate: HomeScreenViewControllerDelegate?
    
    var securityService: SecurityServiceContract!

    override func viewDidLoad() {
        super.viewDidLoad()
        securityService = SecurityService()

    }
    
    @IBAction func logout(_ sender: Any) {
        securityService.logout()
        delegate?.didTouchLogout()
    }
    
}
