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
        contentLabel.layer.cornerRadius = 10
        contentLabel.layer.borderColor = UIColor.lightGray.cgColor
        contentLabel.layer.borderWidth = 1.0
        
        setupContentLabelConstraints()
    }
    
    func setupContentLabelConstraints() {
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
//            contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            contentLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
