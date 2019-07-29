//
//  GameListModel.swift
//  GameFramework
//
//  Created by 林柏呈 on 2019/7/27.
//  Copyright © 2019 林柏呈. All rights reserved.
//
/*
Game model:
GameList Model: ( name、highscore、number of times、Icon ）
*/
import Foundation

class GameListDataModel {
    
    var gameName: String!
    var highestScore: String!
    var numberOfTimes: String!
    var gameImage: String!
    
    init(gameName: String, highestScore: String, numberOfTimes: String, gameImage: String) {
        self.gameImage = gameName
        self.highestScore = highestScore
        self.numberOfTimes = numberOfTimes
        self.gameImage = gameImage
    }
    
    static let gameListModel: [GameListDataModel] = [GameListDataModel(gameName: "六彩按按樂", highestScore: "3", numberOfTimes: "3", gameImage: "icons8-game-controller-100"), GameListDataModel(gameName: "八方", highestScore: "3", numberOfTimes: "3", gameImage: "icons8-epic-games-100")]
}


