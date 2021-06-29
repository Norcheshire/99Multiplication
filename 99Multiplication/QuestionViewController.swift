//
//  QuestionViewController.swift
//  99Multiplication
//
//  Created by 陳諾 on 2021/6/9.
//

import UIKit

class QuestionViewController: UIViewController {
        
        var index = 1 //題數初始值
        var score = 0 //分數初始值
        var number1 = 0 //題目第一個數字
        var number2 = 0 //題目第二個數字
        var answer = 0 //答案初始值
        var options: [Int] = [] //定義選項型別array
        var option1 = 0 //選項一初始值
        var option2 = 0 //選項二初始值
        var option3 = 0 //選項三初始值
//按鈕圖片
        var btnImage = ["but-1","but-2","but-3","but-4"]

//定義隨機出題的function
        func randomQuestion() {
                
    //隨機顯示選擇題答案選項
            option1 = Int.random(in: 2...81)
            option2 = Int.random(in: 2...81)
            options = [option1,option2]
                
    //隨機顯示number題目數字與answer正確答案
            number1 = Int.random(in: 2...9)
            number2 = Int.random(in: 2...9)
            answer = number1 * number2
                
            options.append(answer) //在options的array裡加入正確答案選項
            options.shuffle()//隨機排序options的array
            btnImage.shuffle()//隨機排序按鈕圖片
               
    //定義隨機出題數字與按鈕圖案
            for i in 0...2 {
                        
                multiChoiceBtns[i].setTitle(String(options[i]), for: .normal)
                multiChoiceBtns[i].setBackgroundImage(UIImage(named: btnImage[i]), for: .normal)
                    }
                    
                number1Label.text = String(number1)
                number2Label.text = String(number2)
                    
                print(options)
                
            }
            
//定義答對時function
        func rightChoices() {
                
            score += 10
            scoreLabel.text = "\(score)"
            rightImage.isHidden = false
            wrongImage.isHidden = true
         
            }

//定義答錯時function
        func wrongChoices(){
                
            rightImage.isHidden = true
            wrongImage.isHidden = false
            
            }

//定義再玩一次function
        func playAgain() {
                
            index = 1
            score = 0
            randomQuestion()
            wrongImage.isHidden = true
            rightImage.isHidden = true
            indexNumber.text = "\(index)"
            scoreLabel.text = "\(score)"
                
            }

        
        @IBOutlet weak var number1Label: UILabel!
        @IBOutlet weak var number2Label: UILabel!
        @IBOutlet weak var scoreLabel: UILabel!
        @IBOutlet weak var indexNumber: UILabel!

//顯示對錯圖片
        @IBOutlet weak var wrongImage: UIImageView!
        @IBOutlet weak var rightImage: UIImageView!
        
//答案選項按鈕
        @IBOutlet var multiChoiceBtns: [UIButton]!
        

        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            playAgain() //畫面載入時先重置畫面
        }
        
//點選答案選項按鈕時的動作
        @IBAction func selectAnswer(_ sender: UIButton){
            index += 1
            indexNumber.text = "\(index)"
            wrongImage.isHidden = true
            rightImage.isHidden = true
          
                
            if sender.currentTitle == String(answer) {
                rightChoices()
            } else {
                wrongChoices()
            }
            
//當答滿10題時
            if index == 11{
                index = 10
                indexNumber.text = "\(index)"
                
                if score  == 0{
                    
                    let controller = UIAlertController(title: "你的分數是：", message: "\(score)分，請加油好嗎！", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "好喔", style: .default)
                    
                    controller.addAction(okAction)
                    let tryAgainAction = UIAlertAction(title: "再玩一次", style: .cancel){ [self] (_) in
                        
                        playAgain()
                        
                    }
                    controller.addAction(tryAgainAction)
                    present(controller, animated: true, completion: nil)
                           
                }else if score <= 50 {
                   
                    let controller = UIAlertController(title: "你的分數是：", message: "\(score)分，加油！再接再勵！💪", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "好喔", style: .default)
                    
                    controller.addAction(okAction)
                    let tryAgainAction = UIAlertAction(title: "再玩一次", style: .cancel){ [self] (_) in
                        
                        playAgain()
                        
                    }
                    controller.addAction(tryAgainAction)
                    present(controller, animated: true, completion: nil)

                }else if score <= 70 {
                    
                    let controller = UIAlertController(title: "你的分數是：", message: "\(score)分，哎唷！不錯喔！👍", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "好喔", style: .default)
                                
                    controller.addAction(okAction)
                    let tryAgainAction = UIAlertAction(title: "再玩一次", style: .cancel){ [self] (_) in
                                    
                        playAgain()
                                    
                    }
                    controller.addAction(tryAgainAction)
                    present(controller, animated: true, completion: nil)

                }else if score <= 90 {
                                
                    let controller = UIAlertController(title: "你的分數是：", message: "\(score)分，太棒了！幫你放煙火🎉", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "太讚了", style: .default)
                                            
                    controller.addAction(okAction)
                    let tryAgainAction = UIAlertAction(title: "再玩一次", style: .cancel){ [self] (_) in
                                                
                        playAgain()
                                                
                    }
                    controller.addAction(tryAgainAction)
                    present(controller, animated: true, completion: nil)

                }else{
                    let controller = UIAlertController(title: "你的分數是：", message: "\(score)分，快去跟班上同學炫耀吧😎", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "馬上去炫耀", style: .default)
                                            
                    controller.addAction(okAction)
                    let tryAgainAction = UIAlertAction(title: "再玩一次", style: .cancel){ [self] (_) in
                                                
                        playAgain()
                                                
                    }
                    controller.addAction(tryAgainAction)
                    present(controller, animated: true, completion: nil)
                }

            }
            
//重複清空資料並隨機出題
                    randomQuestion()
                    scoreLabel.text = "\(score)"
                   
        }

}
