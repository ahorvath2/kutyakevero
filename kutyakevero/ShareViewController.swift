//
//  ShareViewController.swift
//  kutyakevero
//
//  Created by Adam Horvath on 2017. 12. 18..
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dogImageView: UIImageView!
    
    var model: Model!
    
    private func updateUI() {
        imageView?.image = model.selectedBackground.image
        dogImageView?.image = BodyPiece.combineImage(pieces: model.dog)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Select background" {
            if let navigationController = segue.destination as? UINavigationController {
                guard let backgroundSelector = navigationController.childViewControllers.first as? BackgroundSelectorViewController else { return }
                backgroundSelector.model = model
            }
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
    
    @IBAction func selectBackgroundImage(from segue: UIStoryboardSegue) {
        updateUI()
    }
}
