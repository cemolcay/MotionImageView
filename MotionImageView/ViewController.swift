//
//  ViewController.swift
//  MotionImageView
//
//  Created by Cem Olcay on 03/03/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor (white: 247/255.0, alpha: 1)
        
        let motionImage = MotionImageView (
            frame: CGRect (x: 10, y: 30, width: 200, height: 200),
            image: UIImage (named: "yosemite.jpg")!)
        motionImage.center = view.center
        view.addSubview(motionImage)
        
        motionImage.layer.borderColor = UIColor.redColor().CGColor
        motionImage.layer.borderWidth = 2
    }

}

