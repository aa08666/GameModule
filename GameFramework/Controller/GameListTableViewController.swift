//
//  GameListTableViewController.swift
//  GameFramework
//
//  Created by 林柏呈 on 2019/7/27.
//  Copyright © 2019 林柏呈. All rights reserved.
//
/*
 遊戲需求
 - 提供兩個遊戲
 - 遊戲結束機制（限時 + 遊戲失敗）
 - 重玩機制
 - 紀錄遊戲最高分、遊玩次數（顯示在遊戲列表）
 目標
 - 減少新增遊戲的開發成本
 */
import UIKit

class GameListTableViewController: UITableViewController{

    // 使用 Reference 紀錄來自遊戲的最高分與次遊玩次數
    var highestScore: Int = 0
    var numberOftimes: Int = 0
    
    @IBOutlet var myTableView: UITableView!
    // 給 Model 資料
    var gameListDataModels = GameListDataModel.gameListModel
    
    var userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // 註冊 nib 檔案
        let nib = UINib(nibName: "GameListTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "GameListCell")
        
        
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameListDataModel.gameListModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let GameListCellID = "GameListCell"
        let modal = gameListDataModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: GameListCellID, for: indexPath) as! GameListTableViewCell
        // 在 Cell file 裡面 config cell
        cell.settingCell(modal)
        
        return cell
    }
    // 判斷所點選的 Cell
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PassToTouchSegue" {
            guard let touchColorVC = segue.destination as? TouchColorViewController else { return }
            touchColorVC.delegate = self
            touchColorVC.index = sender as! Int
            print(sender as? Int)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            performSegue(withIdentifier: "PassToTouchSegue", sender: indexPath.row)
        }
    }
}

extension GameListTableViewController: TouchColorViewControllerDelegate {
    
    func passData(index: Int, highScroe: Int, gameTimes: Int) {
        
        gameListDataModels[index].highestScore = "\(highScroe)"
        gameListDataModels[index].numberOfTimes = "\(gameTimes)"
        userDefault.set(highScroe, forKey: "highScroe")
        userDefault.set(gameTimes, forKey: "gameTimes")
        
        gameListDataModels[index].highestScore = userDefault.string(forKey: "highScroe")
        gameListDataModels[index].numberOfTimes = userDefault.string(forKey: "gameTimes")
        tableView.reloadData()
    }
    
}
