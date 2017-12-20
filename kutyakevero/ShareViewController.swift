//
//  ShareViewController.swift
//  kutyakevero
//
//  Created by Adam Horvath on 2017. 12. 18..
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var model: Model!
    
    private func updateUI() {
        imageView?.image = model.selectedBackground.image
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
        
    }
}
