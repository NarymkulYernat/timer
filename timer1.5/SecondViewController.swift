//
//  SecondViewController.swift
//  timer1.5
//
//  Created by Ернат on 10.05.2023.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var labelMassage: UILabel!
    var array = ["Джун должен знать все алгоритмы. Мидл должен знать о существовании всех алгоритмов. Сеньор должен знать где сидит джун.", "Звонок в службу технической поддержки: — У меня компьютер не видит принтер; я уже и монитор на него повернула, а он всё равно пишет, что его не видит. Что делать? — Пальцем показывали?", "Переписка в мессенжере. xxx: Вас спец по кибербезопасности случайно не интересует? yyy: да. кидай резюме в почту xxx: Положил на ваш комп на Рабочий стол. Файл называется НАДОБРАТЬ! На всякий случай продублировал в вашу папку Отборные кадры на домашнем. yyy: секундочку! домашний комп в автономке!! он к сетке и инету не подключен никак!!! xxx: Сорри... С домашнего удалил...", "Настоящий программист никогда не ставит комментариев. То, что писалось с трудом, должно пониматься с трудом.", "Сидит программист в столовой, обедает, суп ест. В очках такой, задумчивый, программу думает. Народу никого, все уже поели, ушли. Подходит к нему официантка и заигрывает: — Если вы хотите хорошо провести время, то меня зовут Маша! Программист медленно возвращается на землю и смотрит на официантку отрешенным взглядом и на автопилоте спрашивает: — А если не хочу, то как вас зовут? — А если не хочешь, то меня никак не зовут! — Елки... Точно! Переменную обнулить надо!"]
    
    var time = 0
    
    var timer = Timer()
    
    var isTimerRunning = false
    
    var startTime = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = timeToString(inTime: time)
        
        startTime = time
    }
    
    var currentIndex = 0
        
    @objc func countTime() {
        time -= 1
        
        label.text = timeToString(inTime: time)
        
        if time == 0 {
            timer.invalidate()
        } else if time % 10 == 0 {
            labelMassage.text = array[currentIndex]
            currentIndex = (currentIndex + 1) % array.count
            
            if currentIndex == 0 {
                       timer.invalidate()
                   }
        }
    }

    @IBAction func startTimer(_ sender: Any) {
        
        if isTimerRunning {
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        
        isTimerRunning = true
       
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
    }
    
    @IBAction func restartTimer(_ sender: Any) {
        timer.invalidate()
        time = startTime
        isTimerRunning = false
        label.text = timeToString(inTime: time)
    }
    
    func timeToString(inTime: Int) -> String {
        
        let seconds = inTime % 60
        let minutes = (inTime / 60) % 60
        let hours = inTime / 3600
        
        return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
    }
}
