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
    @IBOutlet weak var usernameLabel: UILabel!
    
    weak var delegate: HomeScreenViewControllerDelegate?
    
    var securityService: SecurityServiceContract!
    var userPreferences: UserPreferencesManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        securityService = SecurityService()
        userPreferences = UserPreferencesManager()
    }
    override func viewDidAppear(_ animated: Bool) {
    usernameLabel.text = userPreferences.username != "" ? userPreferences.username : securityService.currentUser?.email
    }
    
    @IBAction func logout(_ sender: Any) {
        securityService.logout()
        delegate?.didTouchLogout()
        
    }
    
}
