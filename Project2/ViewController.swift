//
//  ViewController.swift
//  Project2
//
//  Created by koala panda on 2023/01/14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var tapCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
       
        askQuestion(action: nil)
       
    }
    @objc func shareTapped() {
        let ac = UIAlertController(title: "Your score is \(score).", message: "", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Done", style: .default))
        present(ac, animated: true)
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = "What is the flag of \(countries[correctAnswer].uppercased())?,Your Score\(score)"

    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        

        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            tapCount += 1
            if tapCount >= 10 {
                let ac3 = UIAlertController(title: "End Of Game", message: "Your Score\(score)", preferredStyle: .alert)
                ac3.addAction(UIAlertAction(title: "Done", style: .default, handler: askQuestion))
                present(ac3, animated: true)
                tapCount = 0
                score = 0
            } else {
                let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                present(ac, animated: true)
            }

        } else {
            title = "Wrong"
            score -= 1
            tapCount += 1
            if tapCount >= 2 {
                let ac3 = UIAlertController(title: "End Of Game", message: "Your Score\(score)", preferredStyle: .alert)
                ac3.addAction(UIAlertAction(title: "Done", style: .default, handler: askQuestion))
                present(ac3, animated: true)
                tapCount = 0
                score = 0
            } else {
                let ac2 = UIAlertController(title: title, message: "Wrong! That's the flag of \(countries[sender.tag]).", preferredStyle: .alert)
                ac2.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                present(ac2, animated: true)
            }
            
        }
        
    }
    

}

