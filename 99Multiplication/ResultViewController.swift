//
//  ResultViewController.swift
//  99Multiplication
//
//  Created by 陳諾 on 2021/6/9.
//

import UIKit

class ResultViewController: UIViewController {
    
    var ResultScore: String!
  
//
//    if ResultScore == 0{
//        resultDescriptionLabel.text = "!"
//        scoreImage.image = UIImage(named: "0")
//    }else if score <= 50 {
//        resultDescriptionLabel.text = "💪 加油！再玩一次！"
//        scoreImage.image = UIImage(named: "50")
//    }
//    else if score <= 70 {
//        resultDescriptionLabel.text = "👍 做得很好！"
//        scoreImage.image = UIImage(named: "70")
//    }else if score <= 90 {
//        resultDescriptionLabel.text = "💎 你太棒了！"
//        scoreImage.image = UIImage(named: "90")
//    }else{
//        resultDescriptionLabel.text = "100！"
//        scoreImage.image = UIImage(named: "100")
//    }
        
    @IBOutlet weak var finalScore: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
  

    }

    @IBAction func seeResult(_ sender: Any) {
        finalScore.text = ResultScore
    }
}


