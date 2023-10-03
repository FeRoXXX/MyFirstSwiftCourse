import UIKit

func mySumFunction(x: Int, y: Int) -> Int{
    return x + y
}

var greeting = "Hello, playground" // variable type string
var sum = 5 * 0.05 //variable type double

var userName = "Jame" // it's codestyle name of variable

userName.append("K")

userName.lowercased()

userName.max()

let userAge = "25" // it's constant

//userAge = "2" that would be a mistake


print(sum)

//Part 2

var tampleStr : String // this variable is a string (define my variable)
//Arrays

var myFirsArray = ["1", "2", "3"] as [Any] // array of any object types

print(myFirsArray)

// Set

var myFirstSet : Set = [1,2,3,4,5]
//Create set

myFirstSet.first
//first element of set

var mySecondSet : Set = [2,6,7,5,3,8]
var myThirdSet = myFirstSet.union(mySecondSet)
myThirdSet.sorted()
//unification sets

//Dictionary

var myFirstDictionary = ["Iphone" : "Apple", "Galaxy" : "Samsung", "Watch" : "Apple"]
myFirstDictionary["Apple"]

//loops

var userCounter = 0

while userCounter != 5 {
    userCounter += 1
}

var myNumber = [10,20,30,40,50,60]
var indexArr = 0

for flag in myNumber{
    myNumber[indexArr] = flag / 5
    indexArr += 1
}
print(myNumber)

for flag in 0 ... (myNumber.endIndex - 1) {
    myNumber[flag] *= 5
}
print(myNumber)

mySumFunction(x: 1, y: 5)

// Optionals

var userFirstName : String?

userFirstName?.uppercased()

//userFirstName!.uppercased() its does not work

userFirstName = "5"

var value = (Int(userFirstName ?? "0") ?? 0) * 5
