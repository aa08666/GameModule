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
    
    // 跳出訊息
    func alertFunction(title: String, message: String, actionTitle: String)
    // 遊戲失敗
    func gameFail()
    // 新紀錄
    func newhighestScore()
    // 時間倒數
    func countDown()
    // 遊戲重置
    func gameReset()
    // 遊玩次數
    func numberOfTimes(_ number: Int)-> Int
}

extension GameSystems {

    func alertFunction(title: String, message: String, actionTitle: String) {
        
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: actionTitle, style: .default, handler: nil)
    controller.addAction(okAction)
    present(controller, animated: true, completion: nil)
    }
    
    func numberOfTimes(_ number: Int)-> Int {
        
        var gameTimesNumber: Int!
        gameTimesNumber = number
        gameTimesNumber += 1
        return gameTimesNumber
    }
    
}

protocol Delegate: AnyObject {
    func passData(data: String, data2: String, data3: String)
}
