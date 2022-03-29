//
//  MoviesTVC.swift
//  Movies
//
//  Created by Hesham Aly on 29/03/2022.
//


import UIKit

class MoviesTVC: UITableViewController {

    private var service:NetworkService?
    private let router = Router()

    private var movies:[Movie]?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getQuizData(){
            DispatchQueue.main.async {
                MBProgressHUD.hideAllHUDs(for: self.view, animated: true)
                self.tableView.reloadData()
            }
        }
    }

    func setup(){
        service = NetworkService()
        tableView.config()
        tableView.registerCellNib(MovieCell.self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.config((movies?[indexPath.row])!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        router.navigateToHeroDetailsVC(from: <#T##ViewControllerType#>, data: <#T##Movie#>)
    }

}


extension MoviesTVC{
    
    func getQuizData(_ completion: (() -> Void)? = nil){
        let request = FetchMoviesRequest()
        MBProgressHUD.showAdded(to: self.view, animated: true)
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
