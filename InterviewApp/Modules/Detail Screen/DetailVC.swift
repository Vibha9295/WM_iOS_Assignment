//
//  DetailVC.swift
//  InterviewApp
//
//  Created by Mac on 24/07/23.
//  Copyright © 2023 Tulai, Andrei. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var photoUrl: String!

    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        img.kf.setImage(with: URL(string: photoUrl))

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
