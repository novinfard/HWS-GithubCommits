//
//  ViewController.swift
//  GithubCommits
//
//  Created by Soheil on 12/01/2018.
//  Copyright © 2018 Soheil Novinfard. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UITableViewController {
	
	var container: NSPersistentContainer!

	override func viewDidLoad() {
		super.viewDidLoad()

		container = NSPersistentContainer(name: "MyModel")
		
		container.loadPersistentStores { (storeDescription, error) in
			if let error = error {
				print("Unsolved erro \(error.localizedDescription)")
			}
		}
		
		performSelector(inBackground: #selector(fetchCommits), with:
			nil)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func saveContext() {
		if container.viewContext.hasChanges {
			do {
				try container.viewContext.save()
			} catch {
         		print("An error occurred while saving: \(error)")
			}
		}
	}
	
	@objc public func fetchCommits() {
		if let data = try? String(contentsOf: URL(string:"http://api.github.com/repos/apple/swift/commits?per_page=100")!) {
			let jsonCommits = JSON(parseJSON: data)
			let jsonCommitArray = jsonCommits.arrayValue
			
			print("Received \(jsonCommitArray.count) new commits.")
			
			DispatchQueue.main.async {
				[unowned self] in
				for jsonCommit in jsonCommitArray {
					let commit = Commit(context: self.container.viewContext)
					self.configure(commit: commit, usingJSON: jsonCommit)
				}
				
				self.saveContext()
			}
			
		}
	}
	
	func configure(commit: Commit, usingJSON json: JSON) {
		commit.sha = json["sha"].stringValue
		commit.message = json["commit"]["message"].stringValue
		commit.url = json["html_url"].stringValue
		
		let formatter = ISO8601DateFormatter()
		commit.date = formatter.date(from: json["commit"]["committer"]["date"].stringValue) ?? Date()
	}


}

