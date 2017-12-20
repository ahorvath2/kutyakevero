//
//  MixerViewController.swift
//  kutyakevero
//
//  Created by Adam Horvath on 2017. 12. 18..
//

import UIKit

class MixerViewController: UIViewController {    
    var pager: PiecePageViewController!
    let model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func showOnboarding(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "Show onboarding", sender: nil)
    }
    
    @IBAction func selectPiece(_ sender: UISegmentedControl) {
        guard let bodyPiece = BodyPiece(rawValue: sender.selectedSegmentIndex) else { return }
        pager.bodyPiece = bodyPiece
    }
    
    @IBAction func showNextItem(_ sender: UIButton) {
        pager.showNextItem()
    }
    
    @IBAction func showPreviousItem(_ sender: UIButton) {
        pager.showPreviousItem()
    }
    
    @IBAction func mix(_ sender: UIButton) {
        let randomDog = Model.getRandomDog()
        pager.showItem(at: randomDog[pager.bodyPiece]!)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Embedded pager" {
            pager = segue.destination as? PiecePageViewController
        } else if (segue.identifier == "Show sharing"){
            guard let sharingViewController = segue.destination as? ShareViewController else { return }
            sharingViewController.model = model
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
}
