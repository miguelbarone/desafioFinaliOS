//
//  RegisterController.swift
//  Cinetopzasso
//
//  Created by Bárbara Barone - BBA on 09/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation
protocol RegisterControllerContract {
    func didFinishRegister(_ email: String)
}

protocol RegisterControllerDelegate: class {
    func finish()
}

class RegisterController: RegisterControllerContract {
    weak var delegate: RegisterControllerDelegate?
    
    init(delegate: RegisterControllerDelegate) {
        self.delegate = delegate
    }
    
    func didFinishRegister(_ email: String) {
            if email.contains("@") {
            self.delegate?.finish()
        } else {
            print("Email invalido")
            
        }
    }
    
    
}
