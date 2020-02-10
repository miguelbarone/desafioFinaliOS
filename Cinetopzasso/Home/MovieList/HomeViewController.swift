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
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: HomeScreenViewControllerDelegate?
    
    var securityService: SecurityServiceContract!
    var userPreferences: UserPreferencesManager!
    
    var controller: HomeController?
    var movies: [Movie] = []
    
    init(controller: HomeController, nibName: String? = nil){
        super.init(nibName: nibName, bundle: nil)
        self.controller = controller
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.controller?.set(delegate: self)
        securityService = SecurityService()
        userPreferences = UserPreferencesManager()
        setup()
        controller?.fetchMovies()
    }
    override func viewDidAppear(_ animated: Bool) {
    usernameLabel.text = userPreferences.username != "" ? userPreferences.username : securityService.currentUser?.email
    }
    
    func setup() {
        tableView.register(MoviesTableViewCell.NIB, forCellReuseIdentifier: MoviesTableViewCell.IDENTIFIER)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func logout(_ sender: Any) {
        securityService.logout()
        delegate?.didTouchLogout()
        
    }
    
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.IDENTIFIER) as! MoviesTableViewCell
        
        if let movies = controller?.movies[indexPath.row] {
            cell.configure(movie: movies)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        controller?.showDetails(index: indexPath)
    }
}

extension HomeViewController: MoviesViewModelViewDelegate {
    func didUpdateMoviesList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didCompleteWithError(_ message: String) {
        
    }
}

