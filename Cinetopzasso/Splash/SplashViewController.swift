//
//  SplashViewController.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 04/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

protocol SplashViewDelegate {
    func didFinishLoading()
}

class SplashViewController: UIViewController {
    @IBOutlet weak var logoLabel: UILabel!
    
    var delegate: SplashViewDelegate?
    
    static func instantiate() -> SplashViewController {
        return SplashViewController(nibName: "SplashViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3.0, animations: {
            self.logoLabel.alpha = 1.0
        }) { _ in
            self.delegate?.didFinishLoading()
        }
        
        
    }
}
