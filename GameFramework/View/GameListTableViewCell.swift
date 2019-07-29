//
//  GameListTableViewCell.swift
//  GameFramework
//
//  Created by 林柏呈 on 2019/7/29.
//  Copyright © 2019 林柏呈. All rights reserved.
//

import UIKit

class GameListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var gameHighestLabel: UILabel!
    @IBOutlet weak var gameNumberOfTimesLabel: UILabel!
    @IBOutlet weak var gameImageView: UIImageView!
    
    func settingCell(_ gameModel: GameListDataModel) {
        
        gameNameLabel.text = gameModel.gameName
        gameHighestLabel.text = gameModel.highestScore
        gameNumberOfTimesLabel.text = gameModel.numberOfTimes
        gameImageView.image = UIImage(named: gameModel.gameImage)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
