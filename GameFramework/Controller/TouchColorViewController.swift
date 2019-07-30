//
//  TouchMEGmaeViewController.swift
//  GameFramework
//
//  Created by 林柏呈 on 2019/7/27.
//  Copyright © 2019 林柏呈. All rights reserved.
//

import UIKit


// FIX: gameTimes 可能要使用 escaping 才能

protocol TouchColorViewControllerDelegate: AnyObject {
    func passData(index: Int, highScroe: Int, gameTimes: Int)
}

class TouchColorViewController: UIViewController, GameSystems {
    
    weak var delegate: TouchColorViewControllerDelegate?
    
    var index: Int?
    
    var timer: Timer?
    var secondTimer: Timer?
    let defaul = UserDefaults.standard

    var passHighestScore: Int!
    
    var currentScore = 0
    var highestScore = 0
    var currentTime = 10
    var gameTimes = 0
    
    let gameListTableVC = GameListTableViewController()
    
    @IBOutlet weak var colorLabel: UILabel!
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    @IBOutlet weak var highestScoreLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!
    
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var gameTimesLabel: UILabel!
    
    var colorLabelText = ["紅","橘","黃","灰","藍","綠"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        highestScoreLabel.text! = "\(currentScore)"
        gameTimesLabel.text! = "\(String(describing: gameTimes))"
        defaul.set(currentScore, forKey: "currentScore")
        defaul.set(passHighestScore, forKey: "passHighestScore")
        defaul.set(gameTimes, forKey: "gameTimes")
    }
    
    func timesNumber() {
        gameTimes = defaul.integer(forKey: "gameTimes")
        gameTimes = numberOfTimes(gameTimes)
    }
    
    @IBAction func backToGameListButton(_ sender: UIButton) {
        if let index = index {
            delegate?.passData(index: index, highScroe: passHighestScore, gameTimes: gameTimes)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func newhighestScore() {
        if currentScore > highestScore {
            highestScore = currentScore
            passHighestScore = highestScore
            highestScore = defaul.integer(forKey: "currentScore")
            
            alertFunction(title: "恭喜", message: "新紀錄", actionTitle: "OK")
        }else{
            alertFunction(title: "歐歐", message: "再接再厲", actionTitle: "OK")
        }
    }
    
    @objc func currentText() {
        colorLabelText.shuffle()
        for i in colorLabelText {
            colorLabel.text! = i
        }
    }
    
    @objc func countDown() {
        currentTime -= 1
        remainingTimeLabel.text! = "\(currentTime)"
        if currentTime == 0 {
            newhighestScore()
            highestScoreLabel.text! = "\(currentScore)"
            currentScore = 0
            currentScoreLabel.text! = "\(currentScore)"
            gameReset()
            timesNumber()
            gameTimesLabel.text! = "\(gameTimes)"
        }
        
        if currentTime == 5 && currentScore < 5 {
            gameFail()
        }
    }
    
    func gameFail() {
            gameReset()
            alertFunction(title: "Hello~", message: "睡著了嗎", actionTitle: "是的，我睡著了")
    }
    
    func timeCountdown() {
        self.secondTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    @IBAction func gameStartButton(_ sender: UIButton) {
        timeCountdown()
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(currentText), userInfo: nil, repeats: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch: UITouch = touches.first as! UITouch
        
        if touch.view == redView && colorLabel.text! == "紅" {
            scorePlus()
        }else if touch.view == blueView && colorLabel.text! == "藍" {
            scorePlus()
        }else if touch.view == yellowView && colorLabel.text! == "黃" {
            scorePlus()
        }else if touch.view == grayView && colorLabel.text! == "灰" {
            scorePlus()
        }else if touch.view == orangeView && colorLabel.text! == "橘" {
            scorePlus()
        }else if touch.view == greenView && colorLabel.text! == "綠" {
            scorePlus()
        }
    }
    
    func scorePlus() {
        
        currentScore += 1
        currentScoreLabel.text! = "\(currentScore)"
    }
    
    func gameReset() {
        
        if self.secondTimer != nil {
            self.secondTimer?.invalidate()
            currentTime = 10
            remainingTimeLabel.text! = "\(10)"
            
        }
        
        if self.timer != nil {
            self.timer?.invalidate()
            colorLabel.text! = "顏色"
            currentScoreLabel.text! = "\(0)"
        }
        
    }
    
    @IBAction func againButton(_ sender: UIButton) {
        newhighestScore()
        gameReset()
    }
}
