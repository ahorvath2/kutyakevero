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
    
    @IBOutlet weak var earImageView: UIImageView!
    @IBOutlet weak var bodyImageView: UIImageView!
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var mouthImageView: UIImageView!
    @IBOutlet weak var eyeImageView: UIImageView!
    
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
        let randomDog = BodyPiece.getRandomPieces()
        model.dog = randomDog
        
        earImageView.image = UIImage(named: randomDog[.ear]!.0)
        mouthImageView.image = UIImage(named: randomDog[.mouth]!.0)
        headImageView.image = UIImage(named: randomDog[.head]!.0)
        bodyImageView.image = UIImage(named: randomDog[.body]!.0)
        eyeImageView.image = UIImage(named: randomDog[.eye]!.0)
        
        pager.showItem(at: randomDog[pager.bodyPiece]!.1)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Embedded pager" {
            pager = segue.destination as? PiecePageViewController
        } else if (segue.identifier == "Show sharing") {
            guard let sharingViewController = segue.destination as? ShareViewController else { return }
            sharingViewController.model = model
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
}
