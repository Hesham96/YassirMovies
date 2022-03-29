//
//  Urls.swift
//  Movies
//
//  Created by Hesham Aly on 29/03/2022.
//


import Foundation

public enum Urls {
    
    //MARK: Base
    private static var base:String { "https://api.themoviedb.org/3/discover/movie?api_key=\(Constants.apiKey)" }
    static var imageBase:String { "https://image.tmdb.org/t/p/w500" }

  
    //MARK:- Movies Requests
    static var getMovies: String{
        return base
    }
    
   
    
    
    
}
