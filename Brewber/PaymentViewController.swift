//
//  PaymentViewController.swift
//  Brewber
//
//  Created by Alex Brashear on 4/5/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit
import Braintree

class PaymentViewController: UIViewController {
    
    var braintreeClient: BTAPIClient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let clientTokenURL = NSURL(string: "https://braintree-sample-merchant.herokuapp.com/client_token")!
        let clientTokenRequest = NSMutableURLRequest(URL: clientTokenURL)
        clientTokenRequest.setValue("text/plain", forHTTPHeaderField: "Accept")
        
        NSURLSession.sharedSession().dataTaskWithRequest(clientTokenRequest) { (data, response, error) -> Void in
            // TODO: Handle errors
            let clientToken = String(data: data!, encoding: NSUTF8StringEncoding)
            
            self.braintreeClient = BTAPIClient(authorization: clientToken!)
            // As an example, you may wish to present our Drop-in UI at this point.
            // Continue to the next section to learn more...
            }.resume()
    }

}
