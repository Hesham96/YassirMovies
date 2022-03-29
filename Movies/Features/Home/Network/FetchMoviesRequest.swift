//
//  FetchMoviesRequest.swift
//  Movies
//
//  Created by Hesham Aly on 29/03/2022.
//

import Foundation

class FetchMoviesRequest: Request {
    var urlRequest: URLRequest {
        return URLRequest(url: URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=c9856d0cb57c3f14bf75bdc6c063b8f3")!)
    }
}
