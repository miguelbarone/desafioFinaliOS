//
//  SecurityService.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 04/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation

protocol SecurityServiceContract {
    var currentUser: User? { get }
    func login(email: String, password: String)
    func logout()
}

class SecurityService: SecurityServiceContract {
    private let LOGGED_USER_KEY = "logged_user"
    private let defaults: UserDefaults = UserDefaults.standard
    
    private var _user: User?
    
    var currentUser: User? {
        return _user
    }
    
    init() {
        guard let currentUserValue = defaults.string(forKey: LOGGED_USER_KEY), !currentUserValue.isEmpty else { return }
        
        _user = User(email: currentUserValue)
    }
    
    func login(email: String, password: String) {
        guard !email.isEmpty, !password.isEmpty else {
            return
        }
        
        defaults.set(email, forKey: LOGGED_USER_KEY)
        _user = User(email: email)
    }
    
    func logout() {
        defaults.set(nil, forKey: LOGGED_USER_KEY)
        _user = nil
    }
}

