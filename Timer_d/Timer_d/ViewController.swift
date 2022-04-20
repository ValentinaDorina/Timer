//
//  ViewController.swift
//  Timer_d
//
//  Created by Student on 06.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Time: UILabel!

    @IBOutlet weak var StartStopButton: UIButton!
    
    @IBOutlet weak var Lap: UIButton!
    
    @IBOutlet weak var TableTime: UITableView!
    
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func Start(_ sender: Any) {
        if(timerCounting)
        {
           timerCounting = false
            timer.invalidate()
            StartStopButton.setTitle("Start", for: .normal)
        }
        else
        {
            timerCounting = true
            StartStopButton.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func timerCounter() -> Void{
        count = count + 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimerString(hours: time.0, minutes: time.1, seconds: time.2)
        Time.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int)
    {
        return ( (seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimerString(hours: Int, minutes: Int, seconds: Int) -> String
    {
        var timeString = ""
        timeString += String(format: "0%2d", hours)
        timeString += " : "
        timeString += String(format: "0%2d", minutes)
        timeString += " : "
        timeString += String(format: "0%2d", seconds)
        return timeString
    }
    
    
    @IBAction func LapAction(_ sender: UIButton) {
        TableTime.reloadData()
    }
    
}

