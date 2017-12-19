//
//  BackgroundSelectorViewController.swift
//  kutyakevero
//
//  Created by Adam Horvath on 2017. 12. 18..
//

import UIKit

typealias Point = (Int, Int)
struct BackgroundItem {
    let imageName: String
    let dogTranslate: Point
    let dogScale: Double
    let dogRotation: Double
}

class BackgroundSelectorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {    

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    private var backgrounds: [BackgroundItem] = [
        BackgroundItem(imageName: "background1", dogTranslate: (0, 0), dogScale: 1, dogRotation: 0),
        BackgroundItem(imageName: "background4", dogTranslate: (0, 0), dogScale: 1, dogRotation: 0),
        BackgroundItem(imageName: "background5", dogTranslate: (0, 0), dogScale: 1, dogRotation: 0),
        BackgroundItem(imageName: "background6", dogTranslate: (0, 0), dogScale: 1, dogRotation: 0),
        BackgroundItem(imageName: "background7", dogTranslate: (0, 0), dogScale: 1, dogRotation: 0),
        BackgroundItem(imageName: "background8", dogTranslate: (0, 0), dogScale: 1, dogRotation: 0),
        BackgroundItem(imageName: "background9", dogTranslate: (0, 0), dogScale: 1, dogRotation: 0),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return backgrounds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCollectionViewCell", for: indexPath) as! PhotoCellCollectionViewCell
        cell.imageView.image = UIImage(named: backgrounds[indexPath.item].imageName)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showSharing(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "Show sharing", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
