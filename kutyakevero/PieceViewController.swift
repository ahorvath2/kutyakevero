//
//  PieceViewController.swift
//  kutyakevero
//
//  Created by Adam Horvath on 2017. 12. 18..
//

import UIKit

class PieceViewController: UIViewController {

    var image: UIImage? = UIImage(named:"logo") {
        didSet {
            imageView?.image = image
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
}
