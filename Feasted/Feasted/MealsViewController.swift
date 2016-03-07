//
//  MealsViewController.swift
//  Feasted
//
//  Created by Joshua Newkirk on 2/24/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import UIKit
import Foundation
import Google

class MealsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    // View Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Data
    private var dataSource : Array<Meal>?
    
    private let cellIdentifier : String = "MealsTableViewCell"
    
    override func viewDidLoad()
    {
        self.dataSource = Array<Meal>()
        self.tableView.registerNib(UINib.init(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : MealsTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? MealsTableViewCell
        
        if cell == nil {
            cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? MealsTableViewCell
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataSource!.count
    }
}