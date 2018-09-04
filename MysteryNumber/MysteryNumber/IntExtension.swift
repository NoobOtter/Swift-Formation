//
//  IntExtension.swift
//  MysteryNumber
//
//  Created by Marc Schneider on 04/09/2018.
//  Copyright © 2018 Hippo. All rights reserved.
//

import Foundation

extension Int {
    init(withRandomNumberBetween minValue:Int, and maxValue:Int) {
        self = minValue + Int(arc4random_uniform(UInt32(maxValue-minValue+1)))
    }
}
