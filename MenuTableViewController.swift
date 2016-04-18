//
//  MenuTableViewController.swift
//  Brewber
//
//  Created by Brashear, Alex on 4/13/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit
import Braintree

class MenuTableViewController: UITableViewController, BTDropInViewControllerDelegate {

    var braintreeClient: BTAPIClient?
    @IBOutlet weak var checkoutButton: UIBarButtonItem!
    
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

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("drinkCellIdentifier", forIndexPath: indexPath)
        
        cell.textLabel?.text = "drink \(indexPath.row)"
        
        return cell
    }

    // MARK: - Braintree UI delegate
    
    /// Informs the delegate when the user has successfully provided payment info that has been
    /// successfully tokenized.
    ///
    /// Upon receiving this message, you should dismiss Drop In.
    ///
    /// @param viewController The Drop In view controller informing its delegate of success
    /// @param tokenization The selected (and possibly newly created) tokenized payment information.
    func dropInViewController(viewController: BTDropInViewController, didSucceedWithTokenization paymentMethodNonce: BTPaymentMethodNonce) {
        postNonceToServer(paymentMethodNonce.nonce) // Send payment method nonce to your server
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /// Informs the delegate when the user has decided to cancel out of the Drop-in payment form.
    ///
    /// Drop-in handles its own error cases, so this cancelation is user initiated and
    /// irreversable. Upon receiving this message, you should dismiss Drop-in.
    ///
    /// @param viewController The Drop-in view controller informing its delegate of failure or cancelation.
    func dropInViewControllerDidCancel(viewController: BTDropInViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func postNonceToServer(paymentMethodNonce: String) {
        let paymentURL = NSURL(string: "https://your-server.example.com/payment-methods")!
        let request = NSMutableURLRequest(URL: paymentURL)
        request.HTTPBody = "payment_method_nonce=\(paymentMethodNonce)".dataUsingEncoding(NSUTF8StringEncoding)
        request.HTTPMethod = "POST"
        
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            // TODO: Handle success or failure
            }.resume()
    }
    
    // Mark: - IBAction's
    
    @IBAction func checkoutButtonPressed(sender: UIBarButtonItem) {
        // If you haven't already, create and retain a `BTAPIClient` instance with a
        // tokenization key OR a client token from your server.
        // Typically, you only need to do this once per session.
        // braintreeClient = BTAPIClient(authorization: aClientToken)
        
        // Create a BTDropInViewController
        let dropInViewController = BTDropInViewController(APIClient: braintreeClient!)
        dropInViewController.delegate = self
        
        // This is where you might want to customize your view controller (see below)
        
        // The way you present your BTDropInViewController instance is up to you.
        // In this example, we wrap it in a new, modally-presented navigation controller:
        dropInViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.Cancel,
            target: self, action: #selector(userDidCancelPayment))
        let navigationController = UINavigationController(rootViewController: dropInViewController)
        presentViewController(navigationController, animated: true, completion: nil)
    }
    
    func userDidCancelPayment() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
