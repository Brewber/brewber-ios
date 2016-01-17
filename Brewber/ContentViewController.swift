//
//  ContentViewController.swift
//  PageViewTest
//
//  Created by Alex Brashear on 1/17/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    var pageIndex: Int!
    var titleText: String!
    var imageFile: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.backgroundColor = UIColor.redColor()
        self.titleLabel.text = self.titleText
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
