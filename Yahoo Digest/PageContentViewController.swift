//
//  PageContentViewController.swift
//  Yahoo Digest
//
//  Copyright © 2015 Joshua Cox. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var backgroundImageView: UIImageView!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var customizeButton: UIButton!
	
	var pageIndex : Int?
	var titleText : String?
	var imageFile : String?
	var descriptionText : String?
	
	override func viewDidLoad() {
		backgroundImageView.image = UIImage(named: imageFile!)
		titleLabel.text = titleText!
		descriptionLabel.text = descriptionText!
		
		if pageIndex == 3 {
			customizeButton.hidden = false
		} else {
			customizeButton.hidden = true
		}
	}
	
	@IBAction func customize(sender: AnyObject) {
		print("customize")
	}
}
