//
//  ViewController.swift
//  SpaceJump
//
//  Created by Malena on 1/4/21.
//  Copyright © 2021 MDB. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
    var randomX = 0
    var randomY = 0
    var score = 0
    var sirisMessage = "hello"
    

    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
       
        score = 0
        scoreLabel.text = "Score: " + String(score)
    }
    
    func updateScore()
    {
        score += 1
        scoreLabel.text = "Score: " + String(score)
        
        // here, Siri's voice will say a congratulatory message when the user gets a point.  The user's score will determine what the message is.
        
        if score == 5
        {
            sirisMessage = "5 points!  Wow!"
        }
        else if score == 10
        {
            sirisMessage = "You're on a roll!"
        }
        else if score == 15
        {
            sirisMessage = "You're a pro!"
        }
        else if score % 2 == 0
        {
            sirisMessage = "Who ray!" // haha I had to write "who ray" instead of "hooray" because if I write the actual word, she says it weirdly haha
        }
        else if score % 3 == 0
        {
            sirisMessage = "Good job!"
        }
        else
        {
            sirisMessage = "Nice work!"
        }
        
        let utterance = AVSpeechUtterance(string: sirisMessage)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    

    @IBAction func imageViewTapped(_ sender: UITapGestureRecognizer)
    {
       // let width = Int(UIScreen.main.bounds.height)
       // let height = Int(UIScreen.main.bounds.width)
       
        randomX = Int.random(in: 0...375)
        randomY = Int.random(in: 0...500)
        
       // sender.view?.center = CGPoint(x: randomX, y: randomY)
        
        UIView.animate(withDuration: 0.6,
                       animations: {
                        sender.view?.center = CGPoint(x: self.randomX, y: self.randomY)
        })
        
        if 0 <= randomX && randomX <= 100 && 0 <= randomY && randomY <= 300
        {
            view.backgroundColor = UIColor.systemTeal
            updateScore()
        }
        else if 287 <= randomX && randomX <= 370 &&  180 <= randomY && randomY <= 475
        {
            view.backgroundColor = UIColor.systemTeal
            updateScore()
        }
        else
        {
            view.backgroundColor = UIColor.white
        }
    }

}

