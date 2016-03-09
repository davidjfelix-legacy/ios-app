//
//  MealsViewController.swift
//  Feasted
//
//  Created by Joshua Newkirk on 2/24/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import Alamofire
import AlamofireImage
import CoreLocation
import Foundation
import UIKit


class MealsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    // View Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Data
    private var dataSource : Array<Meal>!
    private let api : FeastedAPI = FeastedAPI.sharedInstance
    
    private let cellIdentifier : String = "MealsTableViewCell"
    
    override func viewDidLoad()
    {
        self.dataSource = Array<Meal>()
        self.tableView.registerNib(UINib.init(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        self.api.getMeals(CLLocationCoordinate2D(latitude: 39.15, longitude: -84.42), radius: 10.0) { [weak self] (meals, error) -> Void in
            if error == nil {
                self?.dataSource = meals
                self?.tableView.reloadData()
            } else {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(action)
                self?.showDetailViewController(alert, sender: nil)
            }
        }
    }
    
    // MARK - UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 278.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK - UITableViewDataSource
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : MealsTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? MealsTableViewCell
        
        if cell == nil {
            cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? MealsTableViewCell
        }
        
        if let meal : Meal = self.dataSource[indexPath.row] {
            cell!.mealTitleLabel.text = meal.name
            cell!.costLabel.text = "$" + "\(meal.price!)"
            cell!.areaCodeLabel.text = "41011"
            cell!.pickupTimeLabel.text = "Ready from 3:00 - 4:30pm"
            let imageUrl : NSURL = NSURL(string: meal.previewImageUrl!)!
            let placeholder : UIImage = UIImage(named: "food_placeholder")!
            cell!.mealImageView.af_setImageWithURL(imageUrl, placeholderImage: placeholder)
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.dataSource.count
    }
}