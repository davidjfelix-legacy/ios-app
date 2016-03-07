//
//  MealsTableViewCell.swift
//  Feasted
//
//  Created by Joshua Newkirk on 3/6/16.
//  Copyright © 2016 Dinner Solutions LLC. All rights reserved.
//

import UIKit

class MealsTableViewCell: UITableViewCell
{
    // View Outlets
    @IBOutlet weak var imageContainerView: UIView!
    
    // UILabels
    @IBOutlet weak var areaCodeLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var mealTitleLabel: UILabel!
    @IBOutlet weak var pickupTimeLabel: UILabel!
    
    // ImageViews
    @IBOutlet weak var areaCodeImageView: UIImageView!
    @IBOutlet weak var costImageView: UIImageView!
    @IBOutlet weak var glutenFreeImageView: UIImageView!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var pickupTimeImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var savedImageView: UIImageView!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
