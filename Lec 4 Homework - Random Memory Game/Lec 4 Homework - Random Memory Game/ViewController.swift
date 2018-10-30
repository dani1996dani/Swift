//
//  ViewController.swift
//  Lec 4 Homework - Random Memory Game
//
//  Created by Daniel Butrashvili on 30/10/2018.
//  Copyright © 2018 Daniel Butrashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var possibleImages : [String] = ["👻","👻","🎃","🎃","🧠","🧠"]
    var shuffledImages : [String] = []
    
    @IBOutlet var cards: [UIButton]!
    var shownCards = 0
    var firstCard : UIButton?
    var secondCard : UIButton?
    @IBOutlet weak var pointsLabel: UILabel!
    var points = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffledImages = shufflePossibleImages()
        hideAllCards()
    }
    
    @IBAction func cardTapped(_ sender: UIButton) {
        let tag = sender.tag
        
        switch shownCards {
        case 0:
            firstCard = sender
            shownCards+=1
            secondCard = nil
        case 1:
            if firstCard != nil && sender != firstCard{
                secondCard = sender
                shownCards += 1
                checkMatch(firstTag: (firstCard?.tag)!,secondTag: (secondCard?.tag)!)
            }
        default:
            hideAllCards()
            shownCards = 1
            firstCard = sender
            secondCard = nil
        }
        print(shownCards)
        sender.setTitle(shuffledImages[tag], for: .normal)
        sender.backgroundColor = UIColor.white
    }
    
    func hideAllCards(){
        for card in cards{
            card.setTitle("❓", for: .normal)
            card.backgroundColor = UIColor.orange
        }
    }
    
    func checkMatch(firstTag : Int, secondTag : Int){
        let firstString = shuffledImages[firstTag]
        let secondString = shuffledImages[secondTag]
        print(firstString + " " + secondString)
        if firstString == secondString{
            points += 1
            if points >= possibleImages.count / 2{
                pointsLabel.text = "You Won!"
            }else{
                pointsLabel.text = "Spooky Points: \(points)"
            }
            firstCard?.isHidden = true
            secondCard?.isHidden = true
            
        }
    }
    
    func rand(upperBound : Int) -> Int{
        return Int(arc4random_uniform(UInt32(upperBound)))
    }
    
    func shufflePossibleImages() -> [String]{
        var result : [String] = []
        var possibleCopy = possibleImages
        
        while possibleCopy.count > 0{
            result.append(possibleCopy.remove(at: rand(upperBound: possibleCopy.count)))
        }
        
        return result
    }
}

