// Swift Syntax topics: for, for-in, while, repeat-while loops

import UIKit

//MARK: Use a for-loops to repeat a block of code a desired number of times

var total = 0
for i in 0...5 {
    print("Hello")
    total += i
}

print("Total=\(total)")

//MARK: Use a while loop to repeat a block of code until a condition changes

var n = 0
while (n < 5) {
    print("n=\(n)")
    n += 1
}

print("Final n=\(n)")

// The condition of a repeat-while loop is at the end, ensuring that the loop is run at least once

n = 2
repeat {
    print("n=\(n)")
    n *= 2
} while (n < 10)

print("Final n=\(n)")

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

for score in individualScores {
    /* if (score > 50) {
        teamScore += 3
    } else {
        teamScore += 1
    } */
    teamScore += (score > 50) ? 3 : 1
}

print("Calculated team score =\(teamScore)")

//MARK: Use a for-in loop to iterate over items in a dictionary by providing a pair of names to  use for each key-value pair


let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25]
]

var largestNum = 0
var keyFound = ""
for (key, values) in interestingNumbers {
    for value in values {
        if (value > largestNum) {
            largestNum = value
            keyFound = key
        }
    }
}
print("The largest number is: \(largestNum). Its key is '\(keyFound)'.")

