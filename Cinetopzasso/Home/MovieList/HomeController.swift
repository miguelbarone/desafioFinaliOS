//
//  HomeController.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 07/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation

protocol MoviesViewModelContract {
    var movies: [Movie] { get }
    func fetchMovies()
    func set(delegate: MoviesViewModelViewDelegate?)
}

protocol MoviesViewModelViewDelegate: class {
    
    func didUpdateMoviesList()
    func didCompleteWithError(_ message: String)
}

class HomeController: MoviesViewModelContract {
    private var moviesList: [Movie] = []
    
    var movies: [Movie] {
        return moviesList
    }

//  MARK: - Variables
    var service: MoviesService?
    
//  MARK: - Delegates
    weak var delegate: MoviesViewModelViewDelegate?
    
//  MARK: - Methods
    init(delegate: MoviesViewModelViewDelegate?, service: MoviesService?) {
        self.delegate = delegate
        self.service = service ?? MoviesService()
    }
    
    func set(delegate: MoviesViewModelViewDelegate?) {
        self.delegate = delegate
    }
    
    func fetchMovies() {
        service?.list(completionHandler: { (result) in
            guard let list = try? result.get() else {
                self.delegate?.didCompleteWithError("Ocorreu um erro ao recuperar a lista de usuários")
                return
            }
            
            self.moviesList.removeAll()
            self.moviesList.append(contentsOf: list)
            self.delegate?.didUpdateMoviesList()
        })
    }
}
