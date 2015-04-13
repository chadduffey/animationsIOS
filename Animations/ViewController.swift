//
//  ViewController.swift
//  Animations
//
//  Created by Chad Duffey on 11/04/2015.
//  Copyright (c) 2015 Chad Duffey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 1
    var timer = NSTimer()
    var isAnimating = true
    
    @IBOutlet weak var alienImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateImage(sender: AnyObject) {
        
        if isAnimating == true {
            timer.invalidate()
            isAnimating = false
        } else {
        
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            isAnimating = true
        }
        
    }
    
    func doAnimation() {
        if counter == 5 {
            counter = 1
        } else {
            counter++
        }
        
        alienImage.image = UIImage(named: "frame\(counter).png")
    }
    
    //objects have been created, but not yet displayed
    override func viewDidLayoutSubviews() {
        
        //moving in from left option...
        //alienImage.center = CGPointMake(alienImage.center.x - 400, alienImage.center.y)
        
        alienImage.alpha = 0
    }
    
    //moment the user is able to see the screen
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            
                //move in from left option
                //self.alienImage.center = CGPointMake(self.alienImage.center.x + 400, self.alienImage.center.y)
            self.alienImage.alpha = 1
            
        })
        
    }
    

}

