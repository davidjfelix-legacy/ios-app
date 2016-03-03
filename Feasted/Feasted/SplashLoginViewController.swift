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
    override func viewWillAppear(animated: Bool)
    {
        self.navigationController?.navigationBar.hidden = true;
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        self.navigationController?.navigationBar.hidden = false;
    }
}