//
//  UserPreferencesManager.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 06/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation
import UIKit

class UserPreferencesManager {
    private let defaults = UserDefaults.standard
    
    private let USERNAME_KEY = "username"
    
    var username: String {
        return defaults.string(forKey: USERNAME_KEY) ?? ""
    }
    func setUsername(with name: String) {
        defaults.set(name, forKey: USERNAME_KEY)
    }
}
