//
//  Model.swift
//  kutyakevero
//
//  Created by Adam Horvath on 2017. 12. 19..
//  Copyright © 2017. Adam Horvath. All rights reserved.
//

import UIKit

class Model {
    let backgrounds = [
        BackgroundItem(image: UIImage(named: "background1")!, dogTranslate: CGPoint(x: 0, y: 0), dogScale: 1, dogRotation: 0),
        BackgroundItem(image: UIImage(named: "background4")!, dogTranslate: CGPoint(x: 0, y: 0), dogScale: 1, dogRotation: 0),
        BackgroundItem(image: UIImage(named: "background5")!, dogTranslate: CGPoint(x: 0, y: 0), dogScale: 1, dogRotation: 0),
        BackgroundItem(image: UIImage(named: "background6")!, dogTranslate: CGPoint(x: 0, y: 0), dogScale: 1, dogRotation: 0),
        BackgroundItem(image: UIImage(named: "background7")!, dogTranslate: CGPoint(x: 0, y: 0), dogScale: 1, dogRotation: 0),
        BackgroundItem(image: UIImage(named: "background8")!, dogTranslate: CGPoint(x: 0, y: 0), dogScale: 1, dogRotation: 0),
        BackgroundItem(image: UIImage(named: "background9")!, dogTranslate: CGPoint(x: 0, y: 0), dogScale: 1, dogRotation: 0)
    ]
    
    lazy var selectedBackground: BackgroundItem = {
        return backgrounds[0]
    }()
}
