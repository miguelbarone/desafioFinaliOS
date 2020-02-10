//
//  RegisterViewController.swift
//  Cinetopzasso
//
//  Created by Bárbara Barone - BBA on 09/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var againTextField: UITextField!
    
    var controller: RegisterControllerContract!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldSetup()
        
        controller = controller ?? RegisterController(delegate: self)
        
        setGestures()
    }
    
    func textFieldSetup() {
        nameTextField.layer.cornerRadius = 18
        nameTextField.layer.masksToBounds = true
        emailTextField.layer.cornerRadius = 18
        emailTextField.layer.masksToBounds = true
        passwordTextField.layer.cornerRadius = 18
        passwordTextField.layer.masksToBounds = true
        againTextField.layer.cornerRadius = 18
        againTextField.layer.masksToBounds = true
    }
    
    private func setGestures() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func closeKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func finishRegister(_ sender: Any) {
        finishAll()
    }
    
    
    private func dissmissModal() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func finishAll(){
        guard let email = emailTextField.text, !email.isEmpty, let name = nameTextField.text, !name.isEmpty, let password = passwordTextField.text, !password.isEmpty, let again = againTextField.text, !again.isEmpty, again.elementsEqual(password) else {
            
            let alert = UIAlertController(title: "Vai com calma, campeão!", message: "Preencha todos os campos, ou verifique se inseriu os dados corretos.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            return }
        let alert = UIAlertController(title: "Cadastro realizado com sucesso!", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.controller.didFinishRegister(email)
        }))
        
        self.present(alert, animated: true)
    }
}

extension RegisterViewController: RegisterControllerDelegate {
    func finish() {
        self.dissmissModal()
    }
    
}
