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

protocol HomeControllerDelegate: class {
    func didSelecetItem(_ movies: Movie)
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

    var service: MoviesService?
    
    weak var delegate: MoviesViewModelViewDelegate?
    weak var delegateHome: HomeControllerDelegate?
    
    init(delegate: MoviesViewModelViewDelegate?, service: MoviesService?) {
        self.delegate = delegate
        self.service = service ?? MoviesService()
    }
    
    func set(delegate: MoviesViewModelViewDelegate?) {
        self.delegate = delegate
    }
    
    func set(delegateHome: HomeControllerDelegate?) {
        self.delegateHome = delegateHome
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
    
    func showDetails(index: IndexPath) {
        
        let movie = movies[index.row]
        delegateHome?.didSelecetItem(movie)
    }
}
