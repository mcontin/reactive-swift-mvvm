//
//  PostDetailConfigurator.swift
//  MVVM
//
//  Created by CrispyBacon018 on 12/06/2019.
//  Copyright © 2019 Mattia. All rights reserved.
//

import UIKit

class PostDetailConfigurator: NSObject, UITableViewDelegate, UITableViewDataSource {
	
	let post: Post
	var comments: [Comment] = []
	
	init(post: Post, comments: [Comment]) {
		self.post = post
		self.comments = comments
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 1 {
			return "Comments"
		}
		return nil
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return 1
		}
		return comments.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.postDetailCell, for: indexPath) else {
				fatalError("Couldn't dequeue a PostDetailCell")
			}
			cell.setup(with: post)
			return cell
		default:
			let comment = comments[indexPath.row]
			guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.postCommentCell, for: indexPath) else {
				fatalError("Couldn't dequeue a PostCommentCell")
			}
			cell.setup(with: comment)
			return cell
		}
	}
	
}
