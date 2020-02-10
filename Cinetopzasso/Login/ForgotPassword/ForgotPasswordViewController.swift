//
//  ForgotPasswordViewController.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 03/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var controller: ForgotPasswordControllerContract!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textFieldSetup()
        
        controller = controller ?? ForgotPasswordController(delegate: self)
        
        setGestures()
        
    }
    
    func textFieldSetup() {
        emailTextField.layer.cornerRadius = 18
        emailTextField.layer.masksToBounds = true
    }
    private func setGestures() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func closeKeyboard() {
        self.view.endEditing(true)
    }
    
    private func dissmissModal() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func sendRecoverEmail(){
        guard let email = emailTextField.text, !email.isEmpty else {
            let alert = UIAlertController(title: "Insira um e-mail correto!", message: "Verifique o e-mail informado, e tente novamente.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true)
            return
            
        }
        let alert = UIAlertController(title: "Solicitação concluída!", message: "Em instantes, você receberá um e-mail de resgate de senha.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.controller.sendRecoverEmail(email)
        }))
        self.present(alert, animated: true)
    }
    
    @IBAction func sendButton(_ sender: Any) {
        sendRecoverEmail()
    }
}

extension ForgotPasswordViewController: ForgotPasswordViewDelegate {
    func finish() {
        self.dissmissModal()
    }
    
    func alert(error: String) {
        print(error)
    }
}


