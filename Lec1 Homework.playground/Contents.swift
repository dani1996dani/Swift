//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func rightTraiange(height: Int){
    var str = "*"
    for _ in 0..<height{
        print(str)
        str.append("*")
    }
}

rightTraiange(height: 9)

func leftTriangle(height : Int){
    var str : String = ""
    for i in 0..<height{
     str = String(repeating: " ",count:height - i)
        str.append(String(repeating:"*",count: i))
print(str)
    }
    
}

leftTriangle(height: 9)

func printTime(minutes : Int){
    let hours = minutes / 60
    let mins = minutes % 60
    
    print("\(hours) hour\(hours != 1 ? "s" : "") & \(mins) minute\(mins != 1 ? "s" : "")")
}

printTime(minutes: 302)

func sumOfDigits(num : Int) -> Int{
    var deconstrucedNum = num
    var result = 0
    while deconstrucedNum > 0{
        result += deconstrucedNum%10
        deconstrucedNum /= 10
    }
    return result
}

print(sumOfDigits(num: 12345))

func printByDigits(num : Int){
    var str = String(num)
    for char in str{
        print(char,terminator:" ")
    }
    print()
}

printByDigits(num: 1234567890)

func printByDigitsReversed(num : Int){
    var deconstrucedNum = num
    while deconstrucedNum > 0{
        print(deconstrucedNum%10,terminator:deconstrucedNum<=10 ? "\n" : " ")
        deconstrucedNum /= 10
    }
}

printByDigitsReversed(num: 1234567890)


func printFibOfN(n : Int){
    var x = 0;
    var x1 = 1;
    
    for i in 0..<n{
        var sum = x + x1;
        x = x1;
        x1 = sum;
        print(sum,terminator: i+1 == n ? "\n" : ",")
    }
}
printFibOfN(n: 5)
