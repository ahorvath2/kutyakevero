//
//  BodyPieces.swift
//  kutyakevero
//
//  Created by Adam Horvath on 2017. 12. 18..
//

import Foundation
import UIKit

enum BodyPiece: Int {
    case ear = 0
    case mouth
    case eye
    case head
    case body
    
    func getImages() -> [String] {
        switch self {
        case .ear:
            return ["ear1", "ear2", "ear3", "ear4", "ear5", "ear6", "ear7", "ear8", "ear9", "ear10"]
        case .mouth:
            return ["mouth1", "mouth2", "mouth3", "mouth4", "mouth5", "mouth6", "mouth7", "mouth8", "mouth9", "mouth10"]
        case .eye:
            return ["eye1", "eye2", "eye3", "eye4", "eye5", "eye6", "eye7", "eye8", "eye9", "eye10"]
        case .head:
            return  ["head1", "head2", "head3", "head4", "head5", "head6", "head7", "head8", "head9", "head10"]
        case .body:
            return ["body1", "body2", "body3", "body4", "body5", "body6", "body7", "body8", "body9", "body10"]
        }
    }
    
    static func getRandomPieces() -> [BodyPiece : (String, Int)] {
        var retVal = [BodyPiece : (String, Int)]()
        
        retVal[.ear] = BodyPiece.ear.getImages().randomElement()!
        retVal[.mouth] = BodyPiece.mouth.getImages().randomElement()!
        retVal[.eye] = BodyPiece.eye.getImages().randomElement()!
        retVal[.head] = BodyPiece.head.getImages().randomElement()!
        retVal[.body] = BodyPiece.body.getImages().randomElement()!
        
        return retVal
    }
    
    static func combineImage(pieces: [BodyPiece : (String, Int)]) -> UIImage? {
        let images = [UIImage(named: (pieces[.body]!.0)),
                      UIImage(named: (pieces[.head]!.0)),
                      UIImage(named: (pieces[.eye]!.0)),
                      UIImage(named: (pieces[.mouth]!.0)),
                      UIImage(named: (pieces[.ear]!.0))]

        var contextSize = CGSize.zero
        for image in images {
            if let image = image {
                contextSize.width = max(contextSize.width, image.size.width)
                contextSize.height = max(contextSize.height, image.size.height)
            }
        }
        
        UIGraphicsBeginImageContextWithOptions(contextSize, false, 0.0)
        
        for image in images {
            if let image = image {
                image.draw(in: CGRect(x: 0, y: 0, width: image.size.width,  height: image.size.height))
            }
        }
        let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return combinedImage
    }
}

