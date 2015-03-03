//
//  MotionImageView.swift
//  MotionImageView
//
//  Created by Cem Olcay on 03/03/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit
import CoreMotion


extension UIView {
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        } set (value) {
            self.frame = CGRect (x: value, y: self.y, width: self.w, height: self.h)
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        } set (value) {
            self.frame = CGRect (x: self.x, y: value, width: self.w, height: self.h)
        }
    }
    
    var w: CGFloat {
        get {
            return self.frame.size.width
        } set (value) {
            self.frame = CGRect (x: self.x, y: self.y, width: value, height: self.h)
        }
    }
    
    var h: CGFloat {
        get {
            return self.frame.size.height
        } set (value) {
            self.frame = CGRect (x: self.x, y: self.y, width: self.w, height: value)
        }
    }
}

class MotionImageView: UIView {

    private let motionManager = CMMotionManager()
    private var imageView: UIImageView!
    
    private var horizontalDiff: CGFloat = 0
    private var verticalDiff: CGFloat = 0
    
    var horizontalMultiplier: Double = 2
    var verticalMultiplier: Double  = 4
    
    init (frame: CGRect, image: UIImage) {
        super.init(frame: frame)
        clipsToBounds = true
        
        imageView = UIImageView (image: image)
        imageView.center = center
        addSubview(imageView)
        
        horizontalDiff = (imageView.w - w)/2
        verticalDiff = (imageView.h - h)/2
    
        motionManager.gyroUpdateInterval = 1.0 / 60.0
        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler:{
            [unowned self] deviceManager, error in
            let att = deviceManager.attitude
            
            let roll = CGFloat (min (1, max(att.roll * horizontalMultiplier, -1)))
            let pitch = CGFloat (min (1, max(att.pitch * verticalMultiplier, -1)))
            
            self.moveImage(roll, vertical: pitch)
        })
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func moveImage (horizontal: CGFloat, vertical: CGFloat) {
        imageView.center.x = w/2 + horizontalDiff * horizontal
        imageView.center.y = h/2 + verticalDiff * vertical
    }
}
