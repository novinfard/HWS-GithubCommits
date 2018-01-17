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


}

