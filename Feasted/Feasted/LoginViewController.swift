//
//  LoginViewController.swift
//  Feasted
//
//  Created by Joshua Newkirk on 2/24/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation
import Google


class LoginViewController: GAITrackedViewController
{
    // View Outlets
    // UIButtons
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var actionButton: UIButton!
    
    // UILabels
    @IBOutlet weak var actionTitleLabel: UILabel!
    
    private let kAnalyticsScreenName = "login"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.screenName = kAnalyticsScreenName
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated: animated)
        setupNavigation()
    }
    
    func setupNavigation()
    {
        self.navigationItem.backBarButtonItem?.title = "HOME"
    }
    
    func dismissController()
    {
        if self.navigationController != nil {
            self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        } else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func facebookButtonTapped(sender: AnyObject)
    {
        // TODO: Login or Register with Facebook here
    }
    
    @IBAction func googleButtonTapped(sender: AnyObject)
    {
        
    }
}