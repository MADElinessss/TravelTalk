//
//  TravelTalkViewController.swift
//  TravelTalk
//
//  Created by 신정연 on 1/14/24.
//

import UIKit

class TravelTalkViewController: UIViewController {

    @IBOutlet var travelTableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        travelTableView.delegate = self
        travelTableView.dataSource = self
        
        let xib1 = UINib(nibName: TravelTalkTableViewCell.identifier, bundle: nil)
        travelTableView.register(xib1, forCellReuseIdentifier: TravelTalkTableViewCell.identifier)
        let xib2 = UINib(nibName: TravelGroupTalkTableViewCell.identifier, bundle: nil)
        travelTableView.register(xib2, forCellReuseIdentifier: TravelGroupTalkTableViewCell.identifier)
    }

}

extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if mockChatList[indexPath.row].chatroomImage.count == 1 {
            let cell = travelTableView.dequeueReusableCell(withIdentifier: "TravelTalkTableViewCell", for: indexPath) as! TravelTalkTableViewCell
            
            cell.profileNameLabel.text = mockChatList[indexPath.row].chatroomName
            cell.contentLabel.text = mockChatList[indexPath.row].chatList.last?.message
            let originalFormatter = DateFormatter()
            originalFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            originalFormatter.locale = Locale(identifier: "en_US_POSIX")

            let displayFormatter = DateFormatter()
            displayFormatter.dateFormat = "yy.MM.dd"
            displayFormatter.locale = Locale(identifier: "ko_KR")

            if let lastMessageDate = mockChatList[indexPath.row].chatList.last?.date,
               let date = originalFormatter.date(from: lastMessageDate) {
                cell.dateLabel.text = displayFormatter.string(from: date)
            } else {
                cell.dateLabel.text = "날짜 오류"
            }

            cell.profileImageView.image = UIImage(named: mockChatList[indexPath.row].chatroomImage[0])
            cell.profileImageView.layer.cornerRadius = 15
            
            return cell
        } else {
            let cell = travelTableView.dequeueReusableCell(withIdentifier: "TravelGroupTalkTableViewCell", for: indexPath) as! TravelGroupTalkTableViewCell
            
            cell.profileLabel.text = mockChatList[indexPath.row].chatroomName
            cell.contentLabel.text = mockChatList[indexPath.row].chatList.last?.message
            let originalFormatter = DateFormatter()
            originalFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            originalFormatter.locale = Locale(identifier: "en_US_POSIX")

            let displayFormatter = DateFormatter()
            displayFormatter.dateFormat = "yy.MM.dd"
            displayFormatter.locale = Locale(identifier: "ko_KR")

            if let lastMessageDate = mockChatList[indexPath.row].chatList.last?.date,
               let date = originalFormatter.date(from: lastMessageDate) {
                cell.dateLabel.text = displayFormatter.string(from: date)
            } else {
                cell.dateLabel.text = "날짜 오류"
            }

            cell.profileImage1.image = UIImage(named: mockChatList[indexPath.row].chatroomImage[0])
            cell.profileImage1.layer.cornerRadius = 15
            cell.profileImage2.image = UIImage(named: mockChatList[indexPath.row].chatroomImage[1])
            cell.profileImage2.layer.cornerRadius = 15
            cell.profileImage3.image = UIImage(named: mockChatList[indexPath.row].chatroomImage[2])
            cell.profileImage3.layer.cornerRadius = 15
            cell.profileImage4.image = UIImage(named: mockChatList[indexPath.row].chatroomImage[3])
            cell.profileImage4.layer.cornerRadius = 15
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ChattingViewController") as! ChattingViewController
        viewController.chatroomId = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .fade)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
