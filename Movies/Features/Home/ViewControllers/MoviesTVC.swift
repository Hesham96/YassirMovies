//
//  MoviesTVC.swift
//  Movies
//
//  Created by Hesham Aly on 29/03/2022.
//


import UIKit

class MoviesTVC: UITableViewController {

    private var service:NetworkService?
    
    private var movies:[Movie]?

    override func viewDidLoad() {
        super.viewDidLoad()
        service = NetworkService()
        getQuizData(){
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


}


extension MoviesTVC{
    
    func getQuizData(_ completion: (() -> Void)? = nil){
        let request = FetchMoviesRequest()
        service?.get(request: request, completion: { result in
            switch result {
            case .failure(let error):
                print("error -->",error)
                //TODO Add alert
            case .success(let data):
                let response: MoviesResponse = try! JSONDecoder().decode(MoviesResponse.self, from: data)
                self.movies = response.movies
                completion?()
            }
        })
    }
    
}
