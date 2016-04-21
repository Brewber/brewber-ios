//
//  MenuTableViewController.swift
//  Brewber
//
//  Created by Brashear, Alex on 4/13/16.
//  Copyright © 2016 Alex Brashear. All rights reserved.
//

import UIKit
import Braintree

class MenuTableViewController: UITableViewController {

    var braintreeClient: BTAPIClient?
    @IBOutlet weak var checkoutButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupClientToken()
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: String(DrinkTableViewCell), bundle: NSBundle.mainBundle())
        tableView.registerNib(nib, forCellReuseIdentifier: String(DrinkTableViewCell))
        
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func setupClientToken() {
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

// MARK: - UITableViewDelegate

extension MenuTableViewController {
    
}

// MARK: - UITableViewDataSource

extension MenuTableViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(String(DrinkTableViewCell), forIndexPath: indexPath) as? DrinkTableViewCell else {
            assertionFailure("Unable to cast DrinkTableViewCell")
            return UITableViewCell()
        }
        
        cell.viewModel = DrinkTableViewCell.ViewModel(drinkNameString: "Drink Name", drinkPrice: 19.99)
        
        return cell
    }
    
}

// MARK: - BTDropInViewControllerDelegate

extension MenuTableViewController: BTDropInViewControllerDelegate {
    
    func dropInViewController(viewController: BTDropInViewController, didSucceedWithTokenization paymentMethodNonce: BTPaymentMethodNonce) {
        postNonceToServer(paymentMethodNonce.nonce) // Send payment method nonce to your server
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func dropInViewControllerDidCancel(viewController: BTDropInViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
