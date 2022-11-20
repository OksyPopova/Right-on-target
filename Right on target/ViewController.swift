//
//  ViewController.swift
//  Right on target
//
//  Created by Оксана Попова on 18.11.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var lable: UILabel!
    
    var number: Int = 0
    var round: Int = 0
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func checkNumber() {
        //если игра только начинается
        
        if self.round == 0 {
            // генерируем случайное число
            self.number = Int.random(in: 1...50)
            //передаем значение случайного числа в lable
            self.lable.text = String(self.number)
            //устанавливаем счетчик раундов на 1
            self.round = 1
        } else {
            //получаем значение на слайдере
            let numSlider = Int(self.slider.value.rounded())
            //сравниваем значение на слайдере и подсчитываем очки
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number
            } else if numSlider < self.number {
                self.points += 50 - self.number + numSlider
            } else {
                self.points += 50
            }
            if self.round == 5 {
                let alert = UIAlertController(
                    title: "Игра окончена",
                    message: "Вы заработали \(self.points) очков",
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default))
                self.present(alert, animated: true)
                self.round = 1
                self.points = 0
            } else {
                self.round += 1
                }
            self.number = Int.random(in: 1...50)
            self.lable.text = String(self.number)
            
            }
            
        }
    }




