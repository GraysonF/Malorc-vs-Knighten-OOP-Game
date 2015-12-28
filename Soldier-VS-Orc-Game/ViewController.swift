//
//  ViewController.swift
//  Soldier-VS-Orc-Game
//
//  Created by Grayson faircloth on 12/26/15.
//  Copyright © 2015 Grayson Faircloth. All rights reserved.
//
//  Sound and background music credits go to Freesound.org & Bensound.com





import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var Player1: UIImageView!
    @IBOutlet var Player2: UIImageView!
    @IBOutlet var player1attackbutton: UIButton!
    @IBOutlet var player2attackbutton: UIButton!
    @IBOutlet var player1btnlabel: UILabel!
    @IBOutlet var player2btnlabel: UILabel!
    @IBOutlet var Player1HpLabel: UILabel!
    @IBOutlet var player2HpLabel: UILabel!
    @IBOutlet var textlabel: UILabel!
    @IBOutlet var replayBtn: UIButton!
    
    var player1: Character!
    var player2: Character!
    
    var swordsound: AVAudioPlayer!
    var orcsound: AVAudioPlayer!
    var backgroundMusic: AVAudioPlayer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        player1 = Character(name: "Malorc", startingHp: 150, attackPower: 15)
        player2 = Character(name: "Knighten", startingHp: 200, attackPower: 10)
        
        Player1HpLabel.text = "\(player1.hp) HP"
        player2HpLabel.text = "\(player2.hp) HP"
        
        textlabel.text = "Press ATTACK to attack!"
        
        let path = NSBundle.mainBundle().pathForResource("swordnoise", ofType: "wav")
        
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        let path2 = NSBundle.mainBundle().pathForResource("orcnoise", ofType: "wav")
        
        let orcSound = NSURL(fileURLWithPath: path2!)
        
        let path3 = NSBundle.mainBundle().pathForResource("backgroundmusic", ofType: "mp3")
        
        let backgroundUrl = NSURL(fileURLWithPath: path3!)
        

        
        do {
            try swordsound = AVAudioPlayer(contentsOfURL: soundUrl)
            try orcsound = AVAudioPlayer(contentsOfURL: orcSound)
            try backgroundMusic = AVAudioPlayer(contentsOfURL: backgroundUrl)
            swordsound.prepareToPlay()
            orcsound.prepareToPlay()
            backgroundMusic.prepareToPlay()
        }
        catch let err as NSError {
            print(err.debugDescription)
        }
        
        
        backgroundMusic.play()
        
    }

   
    
    @IBAction func onAttackPlayer1(sender: AnyObject) {
       let rand = Int(arc4random_uniform(51))
        
        if rand < 25 {
            player1.attemptAttack(player2.attackPower)
            textlabel.text = "Attacked \(player1.name) for \(player2.attackPower) HP"
            
        }
        else if rand >= 25 {
            textlabel.text = "Missed attack!"
            
            
        }
            
        else {
            textlabel.text = "Draw!"
        }
        if player1.hp > 0 {
            Player1HpLabel.text = "\(player1.hp) HP"
            player1attackbutton.enabled = false
            player2attackbutton.enabled = true
        }
        
        if !player1.isAlive {
            Player1HpLabel.text = ""
            textlabel.text = "\(player2.name) Wins!"
            Player1.hidden = true
            player2attackbutton.enabled = false
            player1attackbutton.enabled = false
            replayBtn.hidden = false
            
        }
        swordsound.play()
        
    }
    
    
    
    
    @IBAction func onAttackPlayer2(sender: AnyObject) {
        let rand = Int(arc4random_uniform(51))
        
        if rand < 25 {
            player2.attemptAttack(player1.attackPower)
            textlabel.text = "Attacked \(player2.name) for \(player1.attackPower) HP"
            
        }
        else if rand >= 25 {
            textlabel.text = "Missed attack!"
            
            
        }
            
        else {
            textlabel.text = "Draw!"
        }
        if player2.hp > 0 {
            player2HpLabel.text = "\(player2.hp) HP"
            player1attackbutton.enabled = true
            player2attackbutton.enabled = false
        }
        
        if !player2.isAlive {
            player2HpLabel.text = ""
            textlabel.text = "\(player1.name) Wins!"
            Player2.hidden = true
            player2attackbutton.enabled = false
            player1attackbutton.enabled = false
            replayBtn.hidden = false
        }
        
        orcsound.play()
        
        
        
    }
    
    @IBAction func onReplayPressed(sender: AnyObject) {
        viewDidLoad()
        player1attackbutton.enabled = true
        player2attackbutton.enabled = true
        Player2.hidden = false
        Player1.hidden = false
        replayBtn.hidden = true
        
    }
    
    

}

