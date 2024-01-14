//
//  MyChattingTableViewCell.swift
//  TravelTalk
//
//  Created by 신정연 on 1/14/24.
//

import UIKit

class MyChattingTableViewCell: UITableViewCell {

    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static let identifier = "MyChattingTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentLabel.layer.borderWidth = 1.0
        contentLabel.layer.borderColor = UIColor.lightGray.cgColor
        contentLabel.layer.cornerRadius = 5
        contentLabel.backgroundColor = .systemGray5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
