//
//  ViewController.swift
//  CathKenny
//
//  Created by Ali Ünal UZUNÇAYIR on 30.04.2025.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0
    var score = 0
    var timer = Timer()
    var hideTimer = Timer()
    var kennys: [UIImageView] = []
    var highScore = 0
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var kennyView: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
   
    override func viewDidLoad() {
    counter = 10
        
        
        
        super.viewDidLoad()
        
        //hİghSCore Check
        let storedHighScore = UserDefaults.standard.integer(forKey: "highScore")
        if storedHighScore == nil {
            highScore = 0
            scoreLabel.text = "HighScore : \(highScore)"
            scoreLabel.text = "HighScore : \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            
            
        }
        kennys = [kennyView,kenny2,kenny3,kenny4,kenny5,kenny6,kenny7,kenny8,kenny9]
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)

        hideTimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(hideMyKenny), userInfo: nil, repeats: true)
      
        for i in 0...8{
            //gesture rec
            kennys[i].isUserInteractionEnabled=true
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(buttonTapped))
            kennys[i].addGestureRecognizer(gestureRecognizer)
        }
        
        
        
    }

@objc func timerFunc() {
    counter-=1
    timeLabel.text = "time left: \(counter)"
    
    //HighScore
    if self.score>self.highScore{
        self.highScore=self.score
        scoreLabel.text="HighScore: \(self.highScore)"
        UserDefaults.standard.set(self.score, forKey: "highScore")
    }
    
    
    
    
    
    
    
    
    if counter == 0 {
        self.timer.invalidate()
        let alert = UIAlertController(title: "Time's Up", message: "Sayk TİME İS UP", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default , handler:nil)
        let returnButton = UIAlertAction(title: "Return", style: UIAlertAction.Style.default) { action in
            self.counter = 10
            self.timeLabel.text = "time left: \(self.counter)"
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerFunc), userInfo: nil, repeats: true)
        }
        alert.addAction(returnButton)
    alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
        
    }
    
@objc func buttonTapped() {
    score+=1
    scoreLabel.text = "Score: \(score)"
    
    }
    
    @objc func hideMyKenny() {
        // örneğin rastgele bir UIImageView'i gizle/göster
        for kennys in kennys {
            kennys.isHidden = true
        }
        
        let randomIndex = Int.random(in: 0..<kennys.count)
        kennys[randomIndex].isHidden = false
    }
       
        
        
    }
        
    

    
    
    
    
    
    


