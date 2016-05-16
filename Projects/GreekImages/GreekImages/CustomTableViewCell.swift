//
//  CustomTableViewCell.swift
//  GreekImages
//
//  Created by Lingren, Harrison on 5/16/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var islandName: UILabel!
    @IBOutlet weak var islandAttractions: UILabel!
    @IBOutlet weak var islandImage: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadIsland(name:String, attractions:String, image:UIImage) {
        islandName.text = name
        islandAttractions.text = attractions
        islandImage.image = image
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}