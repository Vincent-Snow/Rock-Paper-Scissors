//
//  ViewController.swift
//  RPS
//
//  Created by Vincent Snow on 1/8/19.
//  Copyright © 2019 Vincent Snow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func rockClicked(_ sender: Any) {
        buttonClicked(handShape: .rock)
    }
    
    @IBAction func paperClicked(_ sender: Any) {
        buttonClicked(handShape: .paper)
    }
    
    @IBAction func scissorsClicked(_ sender: Any) {
        buttonClicked(handShape: .scissors)
    }
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var playerTwoResultLabel: UILabel!
    @IBOutlet weak var playerOneResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func buttonClicked(handShape: HandShape) {
        let playerTwoResult = HandShape.randomHandShape()
        playerOneResultLabel.text = "You select \(convertToString(handShape: handShape))"
        playerTwoResultLabel.text = "Computer selects \(convertToString(handShape: playerTwoResult))"
        resultsLabel.text = game(one: handShape, two: playerTwoResult).rawValue
        
    }
    
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
    
    func convertToString(handShape: HandShape) -> String {
        switch handShape {
        case .paper:
            return "Paper"
        case .rock:
            return "Rock"
        case .scissors:
            return "Scissors"
        }
    }
    
    func game(one: HandShape, two: HandShape) -> MatchResult {

        if one == two {
            return .tie
        } else if one == .paper && two == .rock {
            return .playerOneWin
        } else if one == .paper && two == .scissors {
            return .playerOneLose
        } else if one == .rock && two == .paper {
            return .playerOneLose
        } else if one == .rock  && two == .scissors {
            return .playerOneWin
        } else if one == .scissors && two == .rock {
            return .playerOneLose
        } else if one == .scissors && two == .paper {
            return .playerOneWin
        } else {
            return .tie
        }
    }
}

