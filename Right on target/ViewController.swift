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
    var round: Int = 1
    var points: Int = 0
    
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    private func getSecondViewController() -> SecondViewController{
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(identifier: "SecondViewController")
        return viewController as! SecondViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // генерируем случайное число
                    self.number = Int.random(in: 1...50)
                    //передаем значение случайного числа в lable
                    self.lable.text = String(self.number)
        
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
        //Создаем метку для вывода номера версии
       let versionLable = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        // изменяем текс метки
        versionLable.text = "Версия 1.1"
        // Добавляем метку в родительский view
        self.view.addSubview(versionLable)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    @IBAction func checkNumber() {
       
            //получаем значение на слайдере
            let numSlider = Int(self.slider.value)
            //сравниваем значение на слайдере и подсчитываем очки
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number
            } else if numSlider < self.number {
                self.points += 50 - self.number + numSlider
            } else {
                self.points += 50
            }
            if self.round == 5 {
                //выводим информационное окно
                //с результатами игры
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
    




