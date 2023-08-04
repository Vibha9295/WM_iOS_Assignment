//
//  DetailViewController.swift
//  InterviewApp
//
//  Created by Mac on 24/07/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Outlet Declaration
    @IBOutlet weak var imagePhoto: UIImageView?
    
    //MARK: - Variable Declaration
    var photoURL: String = ""
    
    //MARK: - View Controller life cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadImage()
    }
    
    private func loadImage() {
        if let url = URL(string: photoURL) {
            imagePhoto?.kf.indicatorType = .activity
            imagePhoto?.kf.setImage(
                with: url,
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                    
                ]
            )
        }
    }
}
