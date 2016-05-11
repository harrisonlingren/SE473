//: Swift Syntax Topics: Functions

import UIKit

//MARK: Use 'func' to declare a plain function with no parameters, no return value

func printMessage()  {
    print("this is the message")
}

func printName(name: String) {
    print("Your name is \(name)")
}

print("Harrison")
print("your name")

// passing an array as a parameter

var thePeople = ["Panos", "Mary", "John", "Adam", "Matt", "Jordan"]

func printAllPeople(people: [String]) {
    for person in people {
        print("Hello \(person)!")
    }
}

printAllPeople(thePeople)


//MARK: Functions with return values

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}

greet("Panos", day: "Tuesday")


func sum(a: Double, b: Double) -> Double {
    return a + b
}

var result = sum(1, b: 2)

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

//MARK: Returning multiple values

func sumAndAvg(numbers: Double...) -> (Double, Double) {
    var sum:Double = 0
    var avg:Double = 0
    
    for number in numbers {
        sum += number
    }
    avg = sum / Double(numbers.count)
    return (sum,avg)
}

print( sumOf(1,2,3,4,5,5,0,3,3,7,5,3,8,6) )
print( sumAndAvg(1,2,3,4,5,5,0,3,3,7,5,3,8,6) )


func now() -> NSDate {
    return NSDate()
}

var d = now()
print("The date is \(d).")


func makeIncrement(index: Int) -> (Int -> Int) {
    /* func addOne(number: Int) -> Int {return number + 1}
    func addTwo(number: Int) -> Int {return number + 2}
    return index == 1 ? addOne : addTwo */
    
    func a(number: Int) -> Int {return (number + index)}
    return a
}

var incFunc = makeIncrement(10)
var stepAmt = incFunc(3)

// Pass a function as a parameter to another function
func hasMatches(items:[Int], condition: ( Int -> Bool) ) -> Bool {
    for item in items {
        if (condition(item)) {return true}
    }
    return false
}




func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var listNumbers = [1,12,3,4,5,5,10,3,3,7,14,3,8,16]
var outcome = hasMatches(listNumbers, condition: lessThanTen)
print("The answer is \(outcome).")



//---------------------------------------------------------//
// EXERCISE: matching with the average of a list of numbers

var list = [11,12,13,22,35,18]

func avg(numbers:[Int]) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum / numbers.count
}

func avgMatch(list:[Int], avg:[Int]->Int) -> Bool {
    let avgVal = avg(list)
    for item in list {
        if (item == avgVal) {return true}
    }
    return false
}

print("Match found ?= \(avgMatch(list, avg: avg)).")


//MARK: Use input to pass parameters by reference (instead of by value)
func swapValues(var a:Int, var b:Int) {
    let temp:Int = a
    a = b
    b = temp
}

var firstNum = 4
var secondNum = 18


print(firstNum, secondNum)
swapValues(firstNum, b: secondNum)
print(firstNum, secondNum)


