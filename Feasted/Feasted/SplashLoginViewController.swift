//
//  SplashLoginViewController.swift
//  Feasted
//
//  Created by Joshua Newkirk on 2/24/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import UIKit
import Foundation

class SplashLoginViewController : UIViewController
{
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var logoTitleLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    private let kRegisterSegueIdentifier = "registerSegue"
    private let kLoginSegueIdentifier = "loginSegue"
    private let kAnalyticsScreenName = "splash_login_screen"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        self.screenName = kAnalyticsScreenName
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.roundButtonCorner(self.loginButton)
        self.roundButtonCorner(self.registerButton)
        self.navigationController?.navigationBar.hidden = true;
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.hidden = false;
    }
    
    private func roundButtonCorner(button : UIButton)
    {
        button.layer.cornerRadius = 3.0
    }
}