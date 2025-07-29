//
//  ViewController.swift
//  Apple Pie
//
//  Created by Akshat Singh  on 22/07/25.
//

import UIKit
var listOfWords = ["buccaneer", "swift", "glorious",
"incandescent", "bug", "program"]

let incorrectMovesAllowed = 7

class ViewController: UIViewController {
    
    var totalWins = 0 {
        didSet {
            newRound ()
        }
    }
    var totallosses = 0{
        didSet {
            newRound ()
        }
    }

    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    var currentGame: Game!
    
    func newRound() {
        if !listOfWords.isEmpty {
            
            let newWord = listOfWords.removeFirst()
            currentGame = Game (word: newWord,
                                incorrectMovesRemaining: incorrectMovesAllowed,
                                guessedLetters: [])
            enableLetterButtons(true)
            updateUl()
            
        } else {
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }

    func updateUl() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
        letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined (separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins),Losses: \(totallosses)"
        treeImageView.image = UIImage (named:
                        "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased ())
        currentGame.playerGuessed (letter: letter)
        updateGameState()
    }
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0 {
            totallosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUl()
        }
    }
}

