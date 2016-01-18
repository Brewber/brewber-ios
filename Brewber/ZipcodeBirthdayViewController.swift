//
//  ZipcodeBirthdayViewController.swift
//  Brewber
//
//  Created by Alex Brashear on 1/18/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit

class ZipcodeBirthdayViewController: UIViewController {

    @IBOutlet var zipcodeTextField: UITextField!
    @IBOutlet var dayTextField: UITextField!
    @IBOutlet var monthTextField: UITextField!
    
    var modelViewController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray246Color()
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
