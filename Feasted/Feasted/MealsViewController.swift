//
//  MealsViewController.swift
//  Feasted
//
//  Created by Joshua Newkirk on 2/24/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Foundation

import Google

class MealsViewController: GAITrackedViewController, UITableViewDataSource, UITableViewDelegate
{
    private var dataSource : Array<Meal>?
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataSource!.count;
    }
}