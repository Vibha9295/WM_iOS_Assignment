//
//  PhotoCollectionViewCell.swift
//  InterviewApp
//
//  Created by Mac on 24/07/23.
//

import UIKit
import Kingfisher
class PhotoCollectionViewCell: UICollectionViewCell {
    //MARK: - Outlets
    
    @IBOutlet weak var imgThumbnail: UIImageView?
    
    // MARK: - Configuration
    
    func configure(with photo: PhotoModel) {
        if let url = URL(string: photo.thumbnailUrl ?? "") {
            imgThumbnail?.kf.indicatorType = .activity
            imgThumbnail?.kf.setImage(
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
