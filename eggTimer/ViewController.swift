//
//  ViewController.swift
//  eggTimer
//
//  Created by Mateusz Uszyński on 28/08/2020.
//  Copyright © 2020 Mateusz Uszyński. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = ["soft": 3, "medim": 5, "hard": 7]
    
    var timeRemaining = 10
    var timer = Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func hardnessPressed(_ sender: UIButton) {
        
        titleLabel.text = "Egg Cooking Calculator"
        
        let hardness = sender.currentTitle! //eggTime
        
        timeRemaining = eggTime[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        //example functionality
        if timeRemaining > 0 {
            print(timeRemaining)
            timeRemaining -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
}

