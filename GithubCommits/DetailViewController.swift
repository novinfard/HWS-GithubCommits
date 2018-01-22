//
//  DetailViewController.swift
//  GithubCommits
//
//  Created by Soheil on 13/01/2018.
//  Copyright © 2018 Soheil Novinfard. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	@IBOutlet weak var detailLabel: UILabel!
	
	var detailItem: Commit?
	
    override func viewDidLoad() {
        super.viewDidLoad()

		if let detail = self.detailItem {
			detailLabel.text = detail.message
			// navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Commit 1/\(detail.author.commits.count)", style: .plain, target: self, action: #selector(showAuthorCommits))
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
