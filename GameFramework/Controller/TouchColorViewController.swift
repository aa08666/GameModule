//
//  TouchMEGmaeViewController.swift
//  GameFramework
//
//  Created by 林柏呈 on 2019/7/27.
//  Copyright © 2019 林柏呈. All rights reserved.
//

import UIKit

// TODO: 把值傳回主頁面，(次數、最高分)
// FIX: gameTimes 可能要使用 escaping 才能
class TouchColorViewController: UIViewController, GameSystems {
    
    var timer: Timer?
    var secondTimer: Timer?
    let defaul = UserDefaults.standard
    
    var currentScore = 0
    var highestScore = 0
    var currentTime = 10
    var gameTimes = 0
    
    
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
        defaul.set(gameTimes, forKey: "gameTimes")
        
    }
    
    func timesNumber() {
        
        gameTimes = defaul.integer(forKey: "gameTimes")
        gameTimes = numberOfTimes(gameTimes)
        
    }
    
    func newhighestScore() {
        if currentScore > highestScore {
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
            // 把最高分傳過去
            highestScoreLabel.text! = "\(currentScore)"
            currentScore = 0
            currentScoreLabel.text! = "\(currentScore)"
            gameReset()
            timesNumber()
            gameTimesLabel.text! = "\(gameTimes)"
        }
    }
    
    func gameFail() {
        print("TODO")
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


// 跳 alert 說 目前分數和最高分 點確定後 call again button
