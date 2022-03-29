//
//  FetchMoviesRequest.swift
//  Movies
//
//  Created by Hesham Aly on 29/03/2022.
//

import Foundation

class FetchMoviesRequest: Request {
    var urlRequest: URLRequest {
        let url = URL(string: Urls.getMovies)!
        return URLRequest(url: url)
    }
}
