//
//  FetchMoviesRequest.swift
//  Movies
//
//  Created by Hesham Aly on 29/03/2022.
//

import Foundation

class FetchMoviesRequest: Request {
    var page = 1
    var urlRequest: URLRequest {
        let url = URL(string: Urls.getMovies + "&page=\(page)")!
        return URLRequest(url: url)
    }
}
