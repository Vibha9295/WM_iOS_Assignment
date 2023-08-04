//
//  AlbumCell.swift
//  InterviewApp
//
//  Created by Mac on 24/07/23.
//

import UIKit

class AlbumCell: UITableViewCell {

    @IBOutlet weak var lblAlbumName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with album: AlbumModel) {
        self.lblAlbumName.text = album.title
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
