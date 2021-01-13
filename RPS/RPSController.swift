//
//  RPSController.swift
//  RPS
//
//  Created by Vincent Snow on 1/12/21.
//  Copyright © 2021 Vincent Snow. All rights reserved.
//

import Foundation

class RPSController {
    
    static let sharedController = RPSController()
    
    func game(one: HandShape, two: HandShape) -> MatchResult {
        
        switch (one, two) {
        case (.paper, .rock):
            return .playerOneWin
        case (.paper, .scissors):
            return .playerOneLose
        case (.rock, .paper):
            return .playerOneLose
        case (.rock, .scissors):
            return .playerOneWin
        case (.scissors, .rock):
            return .playerOneLose
        case (.scissors, .paper):
            return .playerOneWin
        default:
            return .tie
        }
    }
}
