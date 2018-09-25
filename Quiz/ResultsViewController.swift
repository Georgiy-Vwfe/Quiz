//
//  ResultsViewController.swift
//  Quiz
//
//  Created by student on 18.09.2018.
//  Copyright © 2018 Postnikov George. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculatePersonalityResult()
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers = [AnimalType: Int]()
        //        var responseTypes = [AnimalType]()
        //        for response in responses{
        //            responseTypes.append(response.type)
        //        }
        
        let animalTypes = responses.map { $0.type }
        for animalType in animalTypes {
            frequencyOfAnswers[animalType] =
                (frequencyOfAnswers[animalType] ?? 0) + 1
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted
        { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "Вы - \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    
}
