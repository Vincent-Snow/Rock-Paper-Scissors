//
//  HandShape.swift
//  RPS
//
//  Created by Vincent Snow on 1/12/21.
//  Copyright © 2021 Vincent Snow. All rights reserved.
//

import Foundation

enum HandShape: UInt32 {
    case rock
    case paper
    case scissors
    
    private static let _count: HandShape.RawValue = {
        // find the maximum enum value
        var maxValue: UInt32 = 0
        while let _ = HandShape(rawValue: maxValue) {
            maxValue += 1
        }
        return maxValue
    }()
    
    static func randomHandShape() -> HandShape {
        // pick and return a new value
        let rand = arc4random_uniform(_count)
        return HandShape(rawValue: rand)!
    }
}

enum MatchResult: String {
    case playerOneWin = "You Win"
    case playerOneLose = "You Lose"
    case tie = "Who can tell"
}
