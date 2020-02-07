//
//  TabBarViewController.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 07/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    var controller: HomeController?

    init(controller: HomeController, nibName: String? = nil){
        super.init(nibName: nibName, bundle: nil)
        self.controller = controller
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let home = HomeViewController(controller: controller ?? HomeController(delegate: nil, service: nil))
                
        home.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        let register = RegisterViewController()

        register.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)

        let tabBarList = [home, register]

        viewControllers = tabBarList

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
