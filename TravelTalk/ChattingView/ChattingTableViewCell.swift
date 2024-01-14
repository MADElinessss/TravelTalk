//
//  ChattingTableViewCell.swift
//  TravelTalk
//
//  Created by 신정연 on 1/14/24.
//

import UIKit

class ChattingTableViewCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static let identifier = "ChattingTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
