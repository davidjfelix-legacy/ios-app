//
//  SplashLoginViewController.swift
//  Feasted
//
//  Created by Joshua Newkirk on 2/24/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation
import Google


class SplashLoginViewController : GAITrackedViewController
{
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var logoTitleLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    private let kRegisterSegueIdentifier = "registerSegue"
    private let kLoginSegueIdentifier = "loginSegue"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.roundButtonCorner(self.loginButton)
        self.roundButtonCorner(self.registerButton)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
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
    
    // MARK - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == kLoginSegueIdentifier {
            
        } else if segue.identifier == kRegisterSegueIdentifier {
            
        }
    }
}