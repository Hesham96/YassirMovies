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

    private var currentPage : Int = 0
    private var totalPages : Int = 1

    private var movies:[Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getMoviesData()
    }

    func setup(){
        service = NetworkService()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        tableView.config()
        tableView.registerCellNib(MovieCell.self)
    }
    
    @objc private func refreshData(_ sender: Any) {
        // Fetch Weather Data
        currentPage = 0
        getMoviesData()
    }
    
    func getMoviesData(){
        fetchMoviesApi(){
            DispatchQueue.main.async {
                self.refreshControl?.endRefreshing()
                MBProgressHUD.hideAllHUDs(for: self.view, animated: true)
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.config((movies[indexPath.row]))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.navigateToMovieDetailsVC(from: self, data: movies[indexPath.row])
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: Fetch Api
extension MoviesTVC{
    
    func fetchMoviesApi(_ completion: (() -> Void)? = nil){
        let request = FetchMoviesRequest()
        currentPage += 1
        request.page = currentPage
        MBProgressHUD.showAdded(to: self.view, animated: true)
        service?.get(request: request, completion: { result in
            switch result {
            case .failure(let error):
                let alert = UIAlertController(title: "Alert", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            case .success(let data):
                let response: MoviesResponse = try! JSONDecoder().decode(MoviesResponse.self, from: data)
                self.totalPages = response.totalPages ?? 0
                self.movies.append(contentsOf: response.movies ?? [])
                completion?()
            }
        })
    }
    
}

//MARK: Pagination
extension MoviesTVC{
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = self.movies.count - 1
            if indexPath.row == lastItem {
                if currentPage < totalPages {
                    getMoviesData()
                }
            }
    }

}
