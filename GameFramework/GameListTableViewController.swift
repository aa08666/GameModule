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

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}