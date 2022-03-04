//
//  ViewController.swift
//  Stroopidity
//
//  Created by Anneka Curry on 2/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0
    var timer = Timer()
    var timeRemaining = 59
    
    let colors = [
        "red",
        "orange",
        "yellow",
        "green",
        "blue",
        "purple",
        "pink",
        "white",
        "black"
    ]
    
    let colorDict: [String:UIColor] = [
        "red" : UIColor.red,
        "orange" : UIColor.orange,
        "yellow" : UIColor.yellow,
        "green" : UIColor.green,
        "blue" : UIColor.blue,
        "purple" : UIColor.purple,
        "pink" : UIColor.systemPink,
        "white" : UIColor.white,
        "black" : UIColor.black
    ]
    
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var gameOverLabel: UILabel!
    
    override func viewDidLoad() {
        timerLabel.isHidden = true
        scoreLabel.isHidden = true
        noButton.isHidden = true
        yesButton.isHidden = true
        restartButton.isHidden = true
        instructionsLabel.isHidden = true
        meaningLabel.isHidden = true
        colorLabel.isHidden = true
        gameOverLabel.isHidden = true
    }
    
    @IBAction func startGameButtonTapped(_ sender: UIButton) {
        sender.isHidden = true
        
        titleLabel.isHidden = true
        subtitleLabel.isHidden = true
        gameOverLabel.isHidden = true
        restartButton.isHidden = true
        
        timerLabel.isHidden = false
        scoreLabel.isHidden = false
        noButton.isHidden = false
        yesButton.isHidden = false
        instructionsLabel.isHidden = false
        meaningLabel.isHidden = false
        colorLabel.isHidden = false
        
        changeColor()
        changeMeaning()
        
        runTimer()
        
    }
    
    
    func updateScore(tappedYes: Bool) {
        
        if colorLabel.textColor == colorDict[meaningLabel.text!] {
            if tappedYes {
                score += 10
            } else {
                score -= 10
            }
            scoreLabel.text = String(score)
        } else {
            if tappedYes{
                score -= 10
            } else {
                score += 10
            }
            scoreLabel.text = String(score)
        }
    }
    
    func addColorToText() {
//        self.meaningLabel.textColor = colorDict.randomElement()?.value
        self.colorLabel.textColor = colorDict.randomElement()?.value
    }
    
    func changeColor() {
        let randomIndex = Int.random(in: 0 ..< colors.count)
        colorLabel.text = colors[randomIndex]
    }
    
    func changeMeaning(){
        let randomIndex = Int.random(in: 0 ..< colors.count)
        meaningLabel.text = colors[randomIndex]
        addColorToText()
    }
    
    @objc func updateTimer() {
        if timeRemaining >= 0 {
            timerLabel.text = "\(timeRemaining)"
            timeRemaining -= 1
        } else {
            endGame()
        }
    }
    
    func runTimer(){
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        updateScore(tappedYes: true)
        changeColor()
        changeMeaning()
    }
    
    @IBAction func noButtonTapped(_ sender: UIButton) {
        updateScore(tappedYes: false)
        changeMeaning()
        changeColor()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        score = 0
        scoreLabel.text = String(score)
        
        changeColor()
        changeMeaning()
        
        timer.invalidate()
        timeRemaining = 59
        timerLabel.text = String("60")
        
        startGameButton.isHidden = false
        titleLabel.isHidden = false
        subtitleLabel.isHidden = false
        gameOverLabel.isHidden = true
        restartButton.isHidden = true
        scoreLabel.isHidden = true
        
        
    }
    
    
    
    func endGame() {
        timerLabel.isHidden = true
        noButton.isHidden = true
        yesButton.isHidden = true
        restartButton.isHidden = false
        instructionsLabel.isHidden = true
        meaningLabel.isHidden = true
        colorLabel.isHidden = true
        
        gameOverLabel.isHidden = false
    }

}

