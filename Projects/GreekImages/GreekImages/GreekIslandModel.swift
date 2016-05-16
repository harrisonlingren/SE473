//
//  GreekIslandModel.swift
//  GreekImages
//
//  Created by Lingren, Harrison on 5/16/16.
//  Copyright © 2016 apps.lingren.co. All rights reserved.
//

import Foundation
import UIKit

class GreekIsland {
    var name:String
    var attractions:String
    var image:UIImage?
    
    init(name:String,attractions:String,imageName:String?) {
        self.name = name
        self.attractions = attractions
        if let imgName = imageName {
            self.image = UIImage(named: imgName)
        } else {
            self.image = UIImage(named: "noimage.jpg")
        }
    }
}