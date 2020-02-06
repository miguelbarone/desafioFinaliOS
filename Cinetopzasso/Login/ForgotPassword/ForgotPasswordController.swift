//
//  ForgotPasswordController.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 05/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation
import UIKit

protocol ForgotPasswordControllerContract {
    func sendRecoverEmail(_ email: String)
}

protocol ForgotPasswordViewDelegate: class {
    func finish()
    func alert(error: String)
}

class ForgotPasswordController: ForgotPasswordControllerContract {
    private weak var delegate: ForgotPasswordViewDelegate?
    
    init(delegate: ForgotPasswordViewDelegate) {
        self.delegate = delegate
    }
    
    func sendRecoverEmail(_ email: String) {
        if email.contains("@") {
            self.delegate?.finish()
        } else {
            self.delegate?.alert(error: "Email inválido")
            
        }
    }
} 
