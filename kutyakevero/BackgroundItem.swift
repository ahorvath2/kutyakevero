//
//  BackgroundItem.swift
//  kutyakevero
//
//  Created by Peter Adam Korodi on 2017. 12. 19..
//

import Foundation

typealias Point = (Int, Int)
struct BackgroundItem {
    let imageName: String
    let dogTranslate: Point
    let dogScale: Double
    let dogRotation: Double
}
