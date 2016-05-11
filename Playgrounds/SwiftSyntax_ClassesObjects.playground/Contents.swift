//Swift Syntax Topics: Classes Objects

import UIKit

/*class Calculator {
    
    var result:Double //object property
    
    init() {
        result = 0
    }
    
    func add(num1:Double, num2:Double) {
        result = num1 + num2
    }
    func multiply(num1:Double, num2:Double) {
        result = num1 * num2
    }
    func divide(num1:Double, num2:Double) {
        result = num1 / num2
    }
    func subtract(num1:Double, num2:Double) {
        result = num1 - num2
    }
    func remainder(num1:Double, num2:Double) {
        result = num1 % num2
    }
}

class Counter {
    var count:Int
    
    init(count:Int) {
        self.count = count // 'self' is used to refer to the name of the property
    }
    
    func incrementBy(amt:Int,numRepeat:Int) {
        count += (amt * numRepeat)
    }
}

class Color {
    var red, green, blue: Double
    
    init(r:Double, g:Double, b:Double) {
        self.red = r
        self.green = g
        self.blue = b
    }
    
    init(gray:Double) {
        self.red = gray
        self.green = gray
        self.blue = gray
    }
}

class Temperature {
    var tempInC, tempInF, tempInK: Double
    // from Fahrenheit
    init(fromF f:Double) {
        tempInC = (f - 32) / 1.8
        tempInF = f
        tempInK = tempInC + 273.15
    }
    init(fromK k:Double) {
        tempInC = k - 273.15
        tempInK = k
        tempInF = (tempInC * 1.8) + 32
    }
    init(fromC c:Double) {
        tempInC = c
        tempInK = tempInC + 273.15
        tempInF = (tempInC * 1.8) + 32
    }
}

class SurveyQuestion {
    var question: String
    var response: String?
    
    init(question: String, response: String?) {
        self.question = question
        self.response = response
    }
    func ask() {
        print(question)
    }
}





// ----------------------------//
// Calculator instance
var calc = Calculator()

calc.multiply(3.5, num2:4.5)
var product = calc.result
print("Product = \(product).")

calc.add(3.5, num2:4.5)
var sum = calc.result
print("Sum = \(sum).")



// ----------------------------//
// Counter instance
var count = Counter(count: 0)
count.incrementBy(5, numRepeat: 4)

print("Result of increment: \(count.count).")


// ----------------------------//
// Color [array] instance
func getColors() -> [Color] {
    let magenta = Color(r:0.8, g:0.1, b:0.6)
    let halfGray = Color(r:0.5, g:0.5, b:0.5)
    let lightBlue = Color(r:0, g:0.3, b:1)
    return [magenta, halfGray, lightBlue]
}

let colors = getColors()
for color in colors {
    print("Red: \(color.red), Green: \(color.green), Blue: \(color.blue).")
}

// ----------------------------//
// Temperature instance

let waterBoilTemp = Temperature(fromF: 212.0)
print("Boiling temperature in Celcius is \(waterBoilTemp.tempInC).")


// ----------------------------//
// SurveyQuestion instance

let cheesyQuestion = SurveyQuestion(question: "Do you like cheese?", response:nil)

cheesyQuestion.ask()
print("The response is: '\(cheesyQuestion.response)'.")


cheesyQuestion.ask()
cheesyQuestion.response = "Yes, I like cheese. Especially feta cheese."

print("The response is: '\(cheesyQuestion.response)'.") */




//MARK: A person class
class Person {
    var firstName,lastName:String
    var age:Int
    var hometown:String?
    
    init(age:Int,hometown:String?) {
        self.age = age
        self.hometown = hometown
        self.lastName = ""
        self.firstName = ""
    }
    
    init(first:String, last:String, age:Int, hometown:String?) {
        self.firstName = first
        self.lastName = last
        self.age = age
        self.hometown = hometown
    }
    
    func fullName() -> String {
        return firstName + " " + lastName
    }
}

/*var alex = Person(age: 34, hometown: nil)
alex.lastName = "Peterson"
alex.firstName = "Alex"

print(alex.fullName())*/



//MARK: create an array of Person objects

func getSmiths() -> [Person] {
    //create Smith Person objects
    let alex = Person(first: "Alex", last: "Smith", age: 24, hometown: "Detroit")
    let scott = Person(first: "Scott", last: "Smith", age: 22, hometown: nil)
    let jane = Person(first: "Jane", last: "Smith", age: 44, hometown: "Chicago")
    
    return [alex, scott, jane]
}

var smithFamily = getSmiths()
//travers the smithFamily array and print everyone's info
for p in smithFamily {
    print("\(p.fullName()) is \(p.age) years old")
}



//MARK: Inheritance of classes
class Vehicle {
    var numWheels: Int
    
    // computed property
    var description: String {
        return "Vehicle has \(numWheels) wheel(s)"
    }
    
    init(wheels:Int) {
        self.numWheels = wheels
    }
}


// create a vehicle
let vehicle = Vehicle(wheels: 2)
print(vehicle.description)

// create a Bicycle object (inherits from Vehicle)
class Bicycle:Vehicle {
    init() {
        super.init(wheels: 2) // need to initialize the super class properties
    }
}