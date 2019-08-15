//
//  ViewController.swift
//  slideOutButtons
//
//  Created by Brandon Wood on 8/14/19.
//  Copyright © 2019 Brandon Wood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var hStackView: UIStackView!
    
    var button2CenterShowing : CGPoint?
    var button3CenterShowing : CGPoint?
    
    var menuShowing : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        button2CenterShowing = button2.center
        button3CenterShowing = button3.center
        

        
        button2.alpha = 0
        button3.alpha = 0
    }


    override func viewDidAppear(_ animated: Bool) {
        button2.center = menuButton.center
        button3.center = menuButton.center
    }
    
    @IBAction func menuButtonPressed(_ sender: Any) {
        
        if (!menuShowing) {
            UIView.animate(
                withDuration: 0.3,
                delay: 0,
                usingSpringWithDamping: 0.80,
                initialSpringVelocity:1,
                options: .curveEaseOut,
                animations: {
                    self.button2.alpha = 1
                    self.button3.alpha = 1
                    self.button2.center = self.button2CenterShowing!
                    self.button3.center = self.button3CenterShowing!
                    self.view.layoutIfNeeded()
                    self.view.layoutSubviews()
            })
        } else {
            
            UIView.animate(withDuration: 0.25, animations: {
                self.button2.alpha = 0
                self.button3.alpha = 0
                self.button2.center = self.menuButton.center
                self.button3.center = self.menuButton.center
            })
            
        }
        
        menuShowing = !menuShowing
    }
    
    
}

