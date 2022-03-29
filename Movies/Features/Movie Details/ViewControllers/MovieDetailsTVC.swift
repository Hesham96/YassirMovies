//
//  MovieDetailsTVC.swift
//  Movies
//
//  Created by Hesham Aly on 29/03/2022.
//

import UIKit

class MovieDetailsTVC: UITableViewController {
    
    
    var movie:Movie?
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        tableView.config()
        fillData()
        
        DispatchQueue.main.async {
            self.overviewLabel.addTrailing(with: "... ", moreText: "Readmore", moreTextFont: .systemFont(ofSize: 16), moreTextColor: .blue)
        }
    }
    
    func fillData(){
        if let posterPath = URL(string: Urls.imageBase + (movie?.posterPath ?? "")){
            self.posterImage.kf.setImage(with: posterPath)
        }
        movieTitleLabel.text = movie?.originalTitle
        releaseDateLabel.text = "\(movie?.releaseDate?.prefix(4) ?? "")"
        overviewLabel.text = movie?.overview
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2{
            overviewLabel.text = movie?.overview
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
