//: Playground - noun: a place where people can play

import UIKit

///结构体为值类型，默认会就行深拷贝
struct Appointment{
    var name:String
    var day:String
    var place:String

    func printDetail(label:String) {
        print("\(label) with \(name) on \(day) at \(place)")
    }
    
}

var  beerMeeting = Appointment(name: "Bob", day: "Mon", place: "BeiJing")
beerMeeting.printDetail(label: "beerMeeting")

var workMeeting = beerMeeting
workMeeting.name = "Alice"
workMeeting.day = "Fri"
//workMeeting.place = "Shanghai"

workMeeting.printDetail(label: "workmeeting")

let beerPointer = withUnsafePointer(to: &beerMeeting, { $0 })
let workPointer = withUnsafePointer(to: &workMeeting, { $0 })

print(beerPointer)
print(workPointer)

print(beerMeeting)
print(workMeeting)





