//
//  FriendsLayout.swift
//  ademNewComputer
//
//  Created by Coleman Coats on 7/22/19.
//  Copyright © 2019 Coleman Coats. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore


struct friendsListInfo {
	let image: UIImage?
	let name: String?
	let title: String?
}

class friendsTVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var data = [friendsListInfo]()
	
	private var tableView: UITableView!
	//reuse ID's
	let privacy = "privacy"
	let cellHeight = 60
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		data = [friendsListInfo.init(image: #imageLiteral(resourceName: "bread"), name: "Will Glockner", title: "Family")]
		
		let setText = UILabel()
		setText.text = "Friends"
		setText.font = UIFont(name: "Lato", size: 20)
		setText.textColor = UIColor.black
		navigationItem.titleView = setText
		navigationController?.navigationBar.isTranslucent = false
		
		let displayWidth: CGFloat = self.view.frame.width
		let displayHeight: CGFloat = self.view.frame.height
		
		tableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight))
		
		
		
		tableView.backgroundColor = UIColor.white
		self.tableView.register(customTableViewCell.self, forCellReuseIdentifier: privacy)
		
		//self.tableView.separatorStyle = .none
		
		self.tableView.dataSource = self
		self.tableView.delegate = self
		self.view.addSubview(tableView)
		
	}
	
	//product Button
	@objc func inspectingFriend() {
		
		let cController = ProductVC(collectionViewLayout: UICollectionViewFlowLayout())
		self.navigationController?.pushViewController(cController, animated: true)
		
		print("Settings Tab is active")
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count ?? 0
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		//let dataSwitch = UISwitch()
		
		let privacy = tableView.dequeueReusableCell(withIdentifier: self.privacy, for: indexPath) as! customTableViewCell
		privacy.friendName = data[indexPath.row].name
		privacy.friendImage = data[indexPath.row].image
		privacy.friendTitle = data[indexPath.row].title
		
		return privacy
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return CGFloat(cellHeight)
	}
	
	//func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	//inspectingFriend()
	//}
}


class customTableViewCell: UITableViewCell {
	
	var friendName: String?
	var friendImage: UIImage?
	var friendTitle: String?
	
	//UIView Profile Pic
	let friendsPicture: UIImageView = {
		let picOfFriend = UIImageView()
		picOfFriend.contentMode = .scaleAspectFill
		picOfFriend.layer.cornerRadius = 25
		picOfFriend.layer.masksToBounds = true
		picOfFriend.clipsToBounds = true
		picOfFriend.layer.shadowColor = UIColor.clear.cgColor
		picOfFriend.layer.borderColor = UIColor.white.cgColor
		picOfFriend.translatesAutoresizingMaskIntoConstraints = false
		
		return picOfFriend
	}()
	
	let friendsName: UILabel = {
		let nameOfFriend = UILabel()
		nameOfFriend.textAlignment = .left
		nameOfFriend.numberOfLines = 1
		nameOfFriend.adjustsFontSizeToFitWidth = true
		//userName.font = UIFont(name: "Lato", size: 80)
		nameOfFriend.font = UIFont.boldSystemFont(ofSize: 20)
		nameOfFriend.textColor = UIColor.ademBlue
		//nameOfFriend.backgroundColor = UIColor.blue
		//userName.text = "Coleman"
		nameOfFriend.translatesAutoresizingMaskIntoConstraints = false
		print("sets the item name")
		return nameOfFriend
	}()
	
	let friendsTitle: UILabel = {
		let access = UILabel()
		access.textAlignment = .left
		access.numberOfLines = 1
		access.adjustsFontSizeToFitWidth = true
		//userName.font = UIFont(name: "Lato", size: 80)
		access.font = UIFont.boldSystemFont(ofSize: 10)
		access.textColor = UIColor.ademBlue
		//access.backgroundColor = UIColor.red
		access.translatesAutoresizingMaskIntoConstraints = false
		print("sets the item name")
		return access
	}()
	
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		self.addSubview(friendsName)
		self.addSubview(friendsPicture)
		self.addSubview(friendsTitle)
		
		/*
		let friendsStackView = UIStackView(arrangedSubviews: [friendsName, friendsTitle])
		friendsStackView.contentMode = .scaleAspectFit
		friendsStackView.translatesAutoresizingMaskIntoConstraints = false
		friendsStackView.distribution = .fillEqually
		friendsStackView.layer.masksToBounds = true
		friendsStackView.clipsToBounds = true
		friendsStackView.axis = .vertical
		
		//self.addSubview(friendsName)
		self.addSubview(friendsStackView)
		self.addSubview(friendsPicture)
		//self.addSubview(friendsTitle)
		
		
		
		
		NSLayoutConstraint.activate([
		
		friendsPicture.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5),
		friendsPicture.topAnchor.constraint(equalTo: self.topAnchor),
		friendsPicture.bottomAnchor.constraint(equalTo: self.bottomAnchor),
		friendsPicture.widthAnchor.constraint(equalTo: self.heightAnchor),
		friendsStackView.leftAnchor.constraint(equalTo: friendsPicture.rightAnchor, constant: 15),
		friendsStackView.topAnchor.constraint(equalTo: self.topAnchor),
		friendsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
		friendsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
		
		])
		*/
		
		NSLayoutConstraint.activate([
			
			friendsPicture.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
			friendsPicture.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
			friendsPicture.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			friendsPicture.heightAnchor.constraint(equalToConstant: 50),
			friendsPicture.widthAnchor.constraint(equalToConstant: 50),
			friendsName.leadingAnchor.constraint(equalTo: friendsPicture.trailingAnchor, constant: 15),
			friendsName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
			friendsName.bottomAnchor.constraint(equalTo: friendsTitle.topAnchor, constant: -10),
			friendsName.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			friendsTitle.leftAnchor.constraint(equalTo: friendsName.leftAnchor),
			friendsTitle.topAnchor.constraint(equalTo: friendsName.bottomAnchor),
			//friendsTitle.heightAnchor.constraint(equalToConstant: 10),
			friendsTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
			friendsTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			
			])
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		if let message = friendName {
			friendsName.text = message
		}
		if let image = friendImage {
			friendsPicture.image = image
		}
		if let title = friendTitle {
			friendsTitle.text = title
		}
	}
	
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

