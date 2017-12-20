//
//  OnboardingViewController.swift
//  kutyakevero
//
//  Created by Adam Horvath on 2017. 12. 18..
//

import UIKit

class OnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
}
