//
//  ChattingViewController.swift
//  TravelTalk
//
//  Created by 신정연 on 1/14/24.
//

import UIKit

class ChattingViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var chatroomId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib1 = UINib(nibName: ChattingTableViewCell.identifier, bundle: nil)
        tableView.register(xib1, forCellReuseIdentifier: ChattingTableViewCell.identifier)
        
        let xib2 = UINib(nibName: MyChattingTableViewCell.identifier, bundle: nil)
        tableView.register(xib2, forCellReuseIdentifier: MyChattingTableViewCell.identifier)

    }
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockChatList[chatroomId].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = mockChatList[chatroomId].chatList[indexPath.row]
        let speaker = data.user
        
        if speaker != User.user {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChattingTableViewCell", for: indexPath) as! ChattingTableViewCell
            
            cell.profileImageView.image = UIImage(named: mockChatList[chatroomId].chatList[indexPath.row].user.rawValue)
            cell.nameLabel.text = speaker.rawValue
            cell.contentLabel.text = data.message
            cell.contentLabel.backgroundColor = .white
            cell.dateLabel.text = data.date
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyChattingTableViewCell", for: indexPath) as! MyChattingTableViewCell
            
            cell.contentLabel.text = data.message
            cell.backgroundColor = .systemGray5
            cell.dateLabel.text = data.date
            
            return cell
        }
    }
}
