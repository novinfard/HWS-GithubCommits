//
//  Commit+CoreDataClass.swift
//  GithubCommits
//
//  Created by Soheil on 17/01/2018.
//  Copyright © 2018 Soheil Novinfard. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Commit)
public class Commit: NSManagedObject {
	
	public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
		super.init(entity: entity, insertInto: context)
		print("Init called")
	}

}
