//
//  BodyPieces.swift
//  kutyakevero
//
//  Created by Adam Horvath on 2017. 12. 18..
//

import Foundation

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
}

