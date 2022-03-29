//
//  SplashVC.swift
//  Movies
//
//  Created by Hesham Aly on 29/03/2022.
//

import UIKit

class SplashVC: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!

    private let router = Router()

    override func viewDidLoad() {
        setup()
    }
    
    
    func setup(){
        logo.alpha = 0
        UIView.animate(
            withDuration: 3,
            delay: 0,
            options: UIView.AnimationOptions.showHideTransitionViews,
            animations: {
                self.logo.alpha = 1
        }
        ) { (Bool) in
            self.navigateToHome()
        }
    }
    
    func navigateToHome(){
        router.navigateToHomeVC(from: self)
    }
}
