//
//  ViewController.swift
//  Quizzler
//  Finished Skeleton code by Kordell M. Schrock 05/12/2019   
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    
    var pickedAnswer : Bool = false
    
    var questionNumber : Int = 0
    //keeps track of the current question
    
    var score : Int = 0
    //keeps track of the current score
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
            if(sender.tag == 1)
            {
                pickedAnswer = true
            }
            else if(sender.tag == 2)
            {
                pickedAnswer = false
            }
        
            checkAnswer()
        
            questionNumber = questionNumber + 1
            //update the current question
        
            nextQuestion()
        
    }
    
    
    func updateUI() {
       
        scoreLabel.text = "Score: \(score)"
        
        progressLabel.text = "\(questionNumber + 1)/ 13"
        
        progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        if(questionNumber <= 12)
        {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI()
            
        }
        else
        {
          
            let alert = UIAlertController(title: "Awesome", message: "You have finsihed the Quiz, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }

    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if(correctAnswer == pickedAnswer)
        {
            score = score + 1
            ProgressHUD.showSuccess("Correct")
        }
        else{
            ProgressHUD.showError("Wrong!")
        }
        
    }
    
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        nextQuestion()
       
    }
    

    
}
