//
//  GameSystems.swift
//  GameFramework
//
//  Created by 林柏呈 on 2019/7/28.
//  Copyright © 2019 林柏呈. All rights reserved.
//

import Foundation
import UIKit


protocol GameSystems: UIViewController {
    
    func alertFunction(title: String, message: String, actionTitle: String)
    
    func gameFail()
    
    func newhighestScore()
    
    func countDown()
    
    func gameReset()
    
    func numberOfTimes(number: Int)-> Int
}

extension GameSystems {

    func alertFunction(title: String, message: String, actionTitle: String) {
        
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: actionTitle, style: .default, handler: nil)
    controller.addAction(okAction)
    present(controller, animated: true, completion: nil)
    }
    
    func numberOfTimes(number: Int)-> Int {
        
        var gameTimesNumber: Int!
        gameTimesNumber = number
        gameTimesNumber += 1
        return gameTimesNumber
    }
    
}
