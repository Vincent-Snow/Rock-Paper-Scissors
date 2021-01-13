//
//  ViewController.swift
//  RPS
//
//  Created by Vincent Snow on 1/8/19.
//  Copyright © 2019 Vincent Snow. All rights reserved.
//

import UIKit

class RPSViewController: UIViewController {


    @IBAction func rockClicked(_ sender: Any) {
        buttonClicked(plyrOneHandShape: .rock)
    }
    
    @IBAction func paperClicked(_ sender: Any) {
        buttonClicked(plyrOneHandShape: .paper)
    }
    
    @IBAction func scissorsClicked(_ sender: Any) {
        buttonClicked(plyrOneHandShape: .scissors)
    }
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var playerTwoResultLabel: UILabel!
    @IBOutlet weak var playerOneResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func buttonClicked(plyrOneHandShape: HandShape) {
        let playerTwoResult = HandShape.randomHandShape()
        playerOneResultLabel.text = "You select \(convertToString(handShape: plyrOneHandShape))"
        playerTwoResultLabel.text = "Your Opponent selects \(convertToString(handShape: playerTwoResult))"
        resultsLabel.text = RPSController.sharedController.game(one: plyrOneHandShape, two: playerTwoResult).rawValue
        
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
}

