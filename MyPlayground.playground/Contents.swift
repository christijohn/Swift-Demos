//: Playground - noun: a place where people can play

import UIKit

@objc protocol Event{
    
    func speechStarted()
    optional func storyStarted()
}

class Stage:Event {
    
    @objc func speechStarted() {
        print("Audience, Speech is going to start")
    }
    
    @objc func storyStarted() {
        print("Audience, Story is going to start")
    }
}

class Schedule {
    
    var delegate:Event?
    let time:Double?
    
    init(time:Double){
        
        self.time = time
    }
    
    func timeChanged(){
        
        if(time == 10.00){
            
            print("Speech time")
            delegate?.speechStarted()
        
        }
        else if(time == 12.00){
            
            print("stroy time")
            delegate?.storyStarted?()
        }
    }
}

var schedule = Schedule(time: 10.00)
schedule.delegate = Stage()
schedule.timeChanged()

schedule = Schedule(time: 12.00)
schedule.delegate = Stage()
schedule.timeChanged()
