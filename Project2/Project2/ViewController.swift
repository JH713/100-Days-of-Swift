//
//  ViewController.swift
//  Projecr2
//
//  Created by 이지현 on 12/11/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var questionNum = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = "(\(questionNum)/10) \(countries[correctAnswer].uppercased()) [Score: \(score)]"
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var wrongMessage: String = ""
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            wrongMessage = "That's the flag of \(countries[sender.tag].uppercased()).\n"
            score -= 1
        }
        if questionNum < 10 {
            questionNum += 1
            let ac = UIAlertController(title: title, message: wrongMessage + "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: title, message: wrongMessage + "Your final score is \(score).", preferredStyle: .alert)
            score = 0
            questionNum = 1
            ac.addAction(UIAlertAction(title: "New game", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
    }
    
}

