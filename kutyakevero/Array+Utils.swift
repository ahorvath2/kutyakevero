//
//  Array+Utils.swift
//  kutyakevero
//
//  Created by Adam Horvath on 2017. 12. 20..
//  Copyright © 2017. Adam Horvath. All rights reserved.
//

import Foundation

extension Array {
    func randomElement() -> (Element, Int)? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        let element = self[index]
        return (element, index)
    }
}
