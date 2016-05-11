//: SwiftSyntax: If-else-if, Switch, Trenary Comparisons Operator, Conditional Assignment, Optionals

import UIKit

//MARK: Use the if-else-if to make decisions

var temp = 90
if temp <= 32 {
    print("Very cold")
    print("Wear coat")
} else if temp >= 86 {
    print("Very hot")
    print("Wear T-shirt")
} else {
    print("Pleasant")
}

// Compare strings

var ping = "ping"
var pong = "pong"

if ping == pong {
    print("equal strings")
} else {
    print ("not equal strings")
}

//MARK: Trenary Conditional Statements
var result = 4 == 4 ? 11 : 12 // Syntax : <setToValue> [Optional] =  <condition> ? <methodForTrue> : <methodForFalse>
print(result)

let tableRows = 50
let hasTitle = true

/*if hasTitle {
let screenHeight = tableRows + 10
} else {
let screenHeight = tableRows + 20
} */

let screenHeight = tableRows + (hasTitle ? 10 : 20)


//MARK: Switch statements

var someChar:Character = "a"
switch(someChar) {
    case "a", "e", "i", "o", "u":
        print ("\(someChar) is a vowel")
    case "b","c"/*list all letters*/:
        print("\(someChar) is not a vowel")
    default:
        print("\(someChar) is neither")
    }
    
    //MARK: Exercise: Can you refactor the following code using a switch statement?
    
    var letterGrade: Character
    var scoreAvg = 87
    
    if scoreAvg < 60 {
        letterGrade = "F"
    } else if  scoreAvg < 70 {
        letterGrade = "D"
    } else if scoreAvg < 80 {
        letterGrade = "C"
    } else if scoreAvg < 90 {
        letterGrade = "B"
    } else if scoreAvg <= 100 {
        letterGrade = "A"
    } else {
        letterGrade = "U"
    }
    
    switch scoreAvg {
    case 0...59:
        letterGrade = "F"
    case 60...69:
        letterGrade = "D"
    case 70...79:
        letterGrade = "C"
    case 80...89:
        letterGrade = "B"
    case 90...100:
        letterGrade = "A"
    default:
        letterGrade = "U"
    }
    
    //MARK: Forced unwrapping -- use the ! when you know that this optional variable definitely has a value and you want it to be used
    
    let possibleString: String? = "An optional string"
    let forcedString = possibleString!
    
    let assumedString:String! = "An implicitly unwrapped optional String"