//
//  Router.swift
//  Movies
//
//  Created by Hesham Aly on 29/03/2022.
//


import UIKit

final class Router {
    class var moviesStoryboard: UIStoryboard {
        return UIStoryboard(name: "Movies", bundle: Bundle.main)
    }
    
    func navigateToHomeVC(from view: ViewControllerType) {
        let vc = Router.moviesStoryboard.instantiateViewController(withIdentifier: "MoviesTVC") as? MoviesTVC
        vc?.modalPresentationStyle = .fullScreen
        if let viewController = view as? UIViewController {
            viewController.present(vc!, animated: true, completion: nil)
        }
    }
    
    func navigateToMovieDetailsVC(from view: ViewControllerType, data: Movie) {
//        let vc = Router.moviesStoryboard.instantiateViewController(withIdentifier: "HeroDetailsVC") as? HeroDetailsVC
//        vc?.viewModel.characterDetailsData.accept(data)
//        if let viewController = view as? UIViewController {
//            viewController.present(vc!, animated: true, completion: nil)
//        }
    }
    
}
