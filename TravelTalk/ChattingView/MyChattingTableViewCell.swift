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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
