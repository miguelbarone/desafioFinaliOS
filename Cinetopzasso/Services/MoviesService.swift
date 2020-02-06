//
//  MoviesService.swift
//  Cinetopzasso
//
//  Created by Miguel Barone - MBA on 06/02/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation
import Alamofire
protocol MoviesServiceContract {
    func get(id: Int, completionHandler: @escaping (Result<Movie,MoviesServiceError>) -> Void)
    func list(completionHandler: @escaping (Result<[Movie],MoviesServiceError>) -> Void)
}
enum MoviesServiceError: Error {
    case error
}
class MoviesService: MoviesServiceContract {
    let baseUrl: String = "http://localhost:3000"
    func list(completionHandler: @escaping (Result<[Movie],MoviesServiceError>) -> Void) {
        AF.request("\(baseUrl)/movies").response { (res) in
            guard let data = res.data, let list = try? JSONDecoder().decode([Movie].self, from: data) else {
                completionHandler(Result.failure(MoviesServiceError.error))
                return
            }
            completionHandler(Result.success(list))
            return
        }
    }
    func get(id: Int, completionHandler: @escaping (Result<Movie,MoviesServiceError>) -> Void) {
        AF.request("\(baseUrl)/movies/\(id)").response { (res) in
            guard let data = res.data, let movie = try? JSONDecoder().decode(Movie.self, from: data) else {
                completionHandler(Result.failure(MoviesServiceError.error))
                return
            }
            completionHandler(Result.success(movie))
            return
        }
    }
}
