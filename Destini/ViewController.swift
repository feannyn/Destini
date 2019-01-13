//
//  ViewController.swift
//  Destini
//

import UIKit

class ViewController: UIViewController {

    // Our strings
    let story1 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\"."
    let answer1a = "I\'ll hop in. Thanks for the help!"
    let answer1b = "Better ask him if he\'s a murderer first."
    
    
    let story2 = "He nods slowly, unphased by the question."
    let answer2a = "At least he\'s honest. I\'ll climb in."
    let answer2b = "Wait, I know how to change a tire."
    
    let story3 = "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
    let answer3a = "I love Elton John! Hand him the cassette tape."
    let answer3b = "It\'s him or me! You take the knife and stab him."
    
    let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
    let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    
    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    // TODO Step 5: Initialise instance variables here
    var currentStory: Int = 0
    var storyArray: [String] = []
    var answerArrayA: [String] = []
    var answerArrayB: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO Step 3: Set the text for the storyTextView, topButton, bottomButton, and to T1_Story, T1_Ans1, and T1_Ans2
        storyTextView.text = story1
        topButton.setTitle(answer1a, for: .normal)
        bottomButton.setTitle(answer1b, for: .normal)
        restartButton.isHidden = true
        storyArray = [story1, story2, story3, story4, story5, story6]
        answerArrayA = [answer1a, answer2a, answer3a]
        answerArrayB = [answer1b, answer2b, answer3b]
        
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        // TODO Step 4: Write an IF-Statement to update the views
        if currentStory == 0 && sender.tag == 1{
            currentStory = 2
            updateStory(storyNum: currentStory)
        }
        else if currentStory == 0 && sender.tag == 2{
            currentStory = 1
            updateStory(storyNum: currentStory)
        }
        else if currentStory == 1 && sender.tag == 1{
            currentStory = 2
            updateStory(storyNum: currentStory)
        }
        else if currentStory == 1 && sender.tag == 2{
            currentStory = 3
            storyTextView.text = storyArray[3]
            topButton.isHidden = true
            bottomButton.isHidden = true
        }
        else if currentStory == 2 && sender.tag == 1 {
            currentStory = 5
            storyTextView.text = storyArray[5]
            topButton.isHidden = true
            bottomButton.isHidden = true
        }
        else if currentStory == 2 && sender.tag == 2 {
            currentStory = 4
            storyTextView.text = storyArray[4]
            topButton.isHidden = true
            bottomButton.isHidden = true
        }
        
        if currentStory == 3 || currentStory == 4 || currentStory == 5 {
            restartButton.isHidden = false
        }
    }
    
    
    @IBAction func restartButtonClicked(_ sender: UIButton) {
        if(sender.tag == 3){
            restart()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateStory(storyNum: Int){
        storyTextView.text = storyArray[storyNum]
        topButton.setTitle(answerArrayA[storyNum], for: .normal)
        bottomButton.setTitle(answerArrayB[storyNum], for: .normal)
    }
    
    func restart(){
        currentStory = 0
        storyTextView.text = story1
        topButton.setTitle(answer1a, for: .normal)
        bottomButton.setTitle(answer1b, for: .normal)
        topButton.isHidden = false
        bottomButton.isHidden = false
        restartButton.isHidden = true
    }
    
    
}

