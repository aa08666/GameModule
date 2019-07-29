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

class GameListTableViewController: UITableViewController {

    @IBOutlet var myTableView: UITableView!
    var gameListDataModel: GameListDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "GameListTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "GameListCell")
        
        gameListDataModel = GameListDataModel.gameListModel.first
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameListDataModel.gameListModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let gameListDataModel = gameListDataModel else {return UITableViewCell()}

        let GameListCellID = "GameListCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GameListCellID, for: indexPath) as! GameListTableViewCell
        cell.gameNameLabel.text = GameListDataModel.gameListModel[indexPath.row].gameName
        cell.gameHighestLabel.text = GameListDataModel.gameListModel[indexPath.row].highestScore
        cell.gameNumberOfTimesLabel.text = GameListDataModel.gameListModel[indexPath.row].numberOfTimes
        cell.gameImageView.image = UIImage(named: GameListDataModel.gameListModel[indexPath.row].gameImage)
        
        cell.settingCell(gameListDataModel)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "touchGame", sender: nil)
//        prepare(for: <#T##UIStoryboardSegue#>, sender: <#T##Any?#>)
        
        if indexPath.count == 0 {
            performSegue(withIdentifier: "touchGame", sender: nil)
        }
    }
}
