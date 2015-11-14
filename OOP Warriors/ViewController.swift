//
//  ViewController.swift
//  OOP Warriors
//
//  Created by James Gobert on 11/12/15.
//  Copyright © 2015 EverydayDigitals. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var playerOneHpLbl: UILabel!

    @IBOutlet weak var playerTwoHpLbl: UILabel!
    
    @IBOutlet weak var textLbl: UILabel!
    
    @IBOutlet weak var playerOneImg: UIImageView!

    @IBOutlet weak var playerTwoImg: UIImageView!

    @IBOutlet weak var winnerbtn: UIButton!
    
    @IBOutlet weak var restartTxt: UILabel!
    
    @IBOutlet weak var playerWinsLbl: UILabel!
    
    var playerOne: PlayerOne!
    var playerTwo: PlayerTwo!
    
    var btnSound : AVAudioPlayer!
    
    var attackSound: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restartGame()
    //Background Music
        let path = NSBundle.mainBundle().pathForResource("Star_Commander", ofType: "wav")
        
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
            btnSound.numberOfLoops = -1
            btnSound.play()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
     //Attack Sound effect
        
        let attackPath = NSBundle.mainBundle().pathForResource("whack", ofType: "mp3")
        
        let attackSoundUrl = NSURL(fileURLWithPath: attackPath!)
        
        do {
            try attackSound = AVAudioPlayer(contentsOfURL: attackSoundUrl)
            attackSound.prepareToPlay()
            attackSound.play()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }

    

    }

    
    @IBAction func playerOneAttackBtn(sender: AnyObject) {
        
        playAttackSound()
        
        if playerTwo.attemptAttack(playerOne.attackPwr) {
            textLbl.text = "Attacked \(playerTwo.name) for \(playerOne.attackPwr) HP"
            playerTwoHpLbl.text = "\(playerTwo.hp) HP"
            
        } else {
            textLbl.text = "Attack Unsuccessful!"
        }
        
        if !playerTwo.isAlive {
            textLbl.text = "Killed \(playerTwo.name)"
            playerTwoImg.hidden = true
            winnerbtn.hidden = false
            restartTxt.hidden = false
            playerWinsLbl.text = "\(playerOne.name) Wins!"
            playerWinsLbl.hidden = false
            
            
        }
    }
    

    
    
    @IBAction func playerTwoAttackBtn(sender: AnyObject) {
        
        playAttackSound()
        
        if playerOne.attemptAttack(playerTwo.attackPwr) {
            textLbl.text = "Attacked \(playerOne.name) for \(playerTwo.attackPwr) HP"
            playerOneHpLbl.text = "\(playerOne.hp) HP"
            
        } else {
            textLbl.text = "Attack Unsuccessful!"
        }
        
        if !playerOne.isAlive {
            textLbl.text = "Killed \(playerOne.name)"
            playerOneImg.hidden = true
            winnerbtn.hidden = false
            restartTxt.hidden = false
            playerWinsLbl.text = "\(playerTwo.name) Wins!"
            playerWinsLbl.hidden = false
            
        }
    }
    
    
    @IBAction func winnerBtnPress(sender: AnyObject) {
        restartGame()
    }
  
    
    func restartGame() {
        playerOneImg.hidden = false
        playerTwoImg.hidden = false
        winnerbtn.hidden = true
        restartTxt.hidden = true
        
        playerOne = PlayerOne(name: "Trebog", hp: 100, attackPwr: 10)
        
        playerOneHpLbl.text = "\(playerOne.hp) HP"
        
        playerTwo = PlayerTwo(name: "Warrior", hp: 100, attackPwr: 10)
        
        playerTwoHpLbl.text = "\(playerTwo.hp) HP"
        
        textLbl.text = ""
        
        playerWinsLbl.hidden = true
    }
    
    func playAttackSound() {
        if attackSound.playing {
            attackSound.stop()
        }
        
        attackSound.play()
    }

}

