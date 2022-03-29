//
//  MovieCell.swift
//  Movies
//
//  Created by Hesham Aly on 29/03/2022.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {

    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    
    private var movie:Movie?
    
    func config(_ movie:Movie){
        self.movie = movie
        if let posterPath = URL(string: Urls.imageBase + (movie.posterPath ?? "")){
            self.posterImage.kf.setImage(with: posterPath)
        }
        movieTitleLabel.text = movie.originalTitle
        releaseDateLabel.text = "\(movie.releaseDate?.prefix(4) ?? "")"
    }
    
}
