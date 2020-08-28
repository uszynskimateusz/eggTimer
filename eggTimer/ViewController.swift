//
//  ViewController.swift
//  eggTimer
//
//  Created by Mateusz Uszyński on 28/08/2020.
//  Copyright © 2020 Mateusz Uszyński. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var timeProgress: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTime = ["soft": 3, "medim": 5, "hard": 7]
    
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0
    
    var player: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func hardnessPressed(_ sender: UIButton) {
        timeProgress.progress = 0
        titleLabel.text = "Egg Cooking Calculator"
        secondsPassed = 0
        
        timer.invalidate()
        let hardness = sender.currentTitle! //eggTime
        
        totalTime = eggTime[hardness]!
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            let precentageProgress = Float(secondsPassed)/Float(totalTime)
            timeProgress.progress = precentageProgress
            secondsPassed += 1
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            timeProgress.progress = 1
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
}

