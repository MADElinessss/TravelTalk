//
//  TravelGroupTalkTableViewCell.swift
//  TravelTalk
//
//  Created by 신정연 on 1/14/24.
//

import UIKit

class TravelGroupTalkTableViewCell: UITableViewCell {

    @IBOutlet var profileImage1: UIImageView!
    @IBOutlet var profileImage2: UIImageView!
    @IBOutlet var profileImage3: UIImageView!
    @IBOutlet var profileImage4: UIImageView!
    
    @IBOutlet var profileLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    static let identifier = "TravelGroupTalkTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
