MotionImageView
===============

An image view lets you move its image with gyro

Demo 
----

![alt tag](https://raw.githubusercontent.com/cemolcay/MotionImageView/master/demo.gif)

Usage
-----

Copy & paste `MotionImageView.swift` into your project.  
Then create a MotionImageView with frame and image.  

``` swift
   let motionImage = MotionImageView (
       frame: CGRect (x: 10, y: 30, width: 200, height: 200),
       image: UIImage (named: "yosemite.jpg")!)
   view.addSubview(motionImage)
```  
  
