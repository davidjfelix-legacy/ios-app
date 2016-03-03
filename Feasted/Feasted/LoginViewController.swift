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
    @IBOutlet weak var confirmLoginOrRegisterButton: UIButton!
    
    override func viewDidLoad()
    {
        self.navigationController?.navigationItem.backBarButtonItem?.title = "HOME";
    }
    
    func setupNavigation()
    {
        
    }
    
    func dismissController()
    {
        
    }
}