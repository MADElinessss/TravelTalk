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
        
        let xib1 = UINib(nibName: ChattingTableViewCell.identifier, bundle: nil)
        tableView.register(xib1, forCellReuseIdentifier: ChattingTableViewCell.identifier)
        
        let xib2 = UINib(nibName: MyChattingTableViewCell.identifier, bundle: nil)
        tableView.register(xib2, forCellReuseIdentifier: MyChattingTableViewCell.identifier)

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockChatList[chatroomId].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = mockChatList[chatroomId].chatList[indexPath.row]
        let speaker = data.user
        
        // MARK: 상대방 대화 내용
        if speaker != User.user {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChattingTableViewCell", for: indexPath) as! ChattingTableViewCell
            
            cell.profileImageView.image = UIImage(named: mockChatList[chatroomId].chatList[indexPath.row].user.rawValue)
            cell.nameLabel.text = speaker.rawValue
            cell.contentLabel.text = data.message
            cell.contentLabel.numberOfLines = 0
            cell.contentLabel.backgroundColor = .white
            cell.contentLabel.frame = cell.contentLabel.frame.insetBy(dx: -10, dy: -10)

            
            let originalFormatter = DateFormatter()
            originalFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            originalFormatter.locale = Locale(identifier: "en_US_POSIX")

            if let date = originalFormatter.date(from: data.date) {
                let displayFormatter = DateFormatter()
                displayFormatter.dateFormat = "hh:mm a"
                displayFormatter.locale = Locale(identifier: "ko_KR")
                cell.dateLabel.text = displayFormatter.string(from: date)
            } else {
                cell.dateLabel.text = "날짜 형식 오류"
            }


            return cell
        // MARK: 내 대화 내용

        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyChattingTableViewCell", for: indexPath) as! MyChattingTableViewCell
            
            cell.contentLabel.text = data.message
            cell.contentLabel.numberOfLines = 0
            cell.contentLabel.frame = cell.contentLabel.frame.insetBy(dx: -10, dy: -10)
            
            let originalFormatter = DateFormatter()
            originalFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            originalFormatter.locale = Locale(identifier: "en_US_POSIX")

            if let date = originalFormatter.date(from: data.date) {
                let displayFormatter = DateFormatter()
                displayFormatter.dateFormat = "hh:mm a"
                displayFormatter.locale = Locale(identifier: "ko_KR")
                cell.dateLabel.text = displayFormatter.string(from: date)
            } else {
                cell.dateLabel.text = "날짜 형식 오류"
            }

            return cell
        }
    }
}
