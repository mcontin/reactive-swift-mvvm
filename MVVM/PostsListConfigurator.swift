//
//  PostsListConfigurator.swift
//  MVVM
//
//  Created by CrispyBacon018 on 12/06/2019.
//  Copyright © 2019 Mattia. All rights reserved.
//

import UIKit

class PostsListConfigurator: NSObject, UITableViewDataSource, UITableViewDelegate {
	
	var posts: [Post]
	
	var didSelectPost: ((Post) -> Void)?
	
	init(posts: [Post]) {
		self.posts = posts
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return posts.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.postCell, for: indexPath) else {
			fatalError("couldn't dequeue")
		}
		
		cell.setup(with: posts[indexPath.row])
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		didSelectPost?(posts[indexPath.row])
	}
	
}
