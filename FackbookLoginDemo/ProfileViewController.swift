//
//  ProfileViewController.swift
//  FackbookLoginDemo
//
//  Created by Poppy on 22/3/2561 BE.
//  Copyright © 2561 Poppy. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var pictureImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    var name: String = ""
    //var picture: AnyObject 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = name
        pictureImageView.image = UIImage(named: "")
    
    }
}
