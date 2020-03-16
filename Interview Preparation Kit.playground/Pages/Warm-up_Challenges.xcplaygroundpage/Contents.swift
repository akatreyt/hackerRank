import Foundation

/*:
# Sock Merchang
## Easy
*/

// Warm-up Challenges
//----------------------//
// Complete the sockMerchant function below.
func sockMerchant(n: Int, ar: [Int]) -> Int {
    var dict = [Int:Int]()
    var pairs = 0
    ar.forEach { (value) in
        
        if let exisValue = dict[value] {
            dict[value] = exisValue + 1
        }else{
            dict[value] = 1
        }
        
        if let value = dict[value]{
            if value % 2 == 0{
                pairs += 1
                dict[value] = 0
            }
        }
    }
    return pairs
}

//print(sockMerchant(n: 9, ar: [10, 20, 20, 10, 10, 30, 50, 10, 20]))


/*:
# Counting Valleys
## Easy
*/
/*----------------------
 wording on this problem was an issue :(
*/
// Complete the countingValleys function below.
func countingValleys(n: Int, s: String) -> Int {
    let steps = Array(s)
    if steps.count != n {
        fatalError()
    }
    var valleyCount = 0
    var level = 0
    
    steps.forEach {
        if $0 == "U"{
            level += 1
        }else if $0 == "D"{
            level -= 1
        }

        if level == 0 && $0 == "U"{
            valleyCount += 1
        }
    }
    return valleyCount
}

//print(countingValleys(n: 1000, s: "UUUUDUUDDDDDUUUDDUUDUDDDUUDUDUDDUDUDDUUUDDDUDDUDDDDDUUUDDUUDDDDDDDDDDDUUDDDDDDUUUUDUDUDDDDUDUDUUUDUDDDDUUDDDDDDDUUUUUUUDDUUUUUDUUUDUDUDDDDUUDDUDDDDDUDUDUDDDDUUDUDUDDUUDDDDDUDDUUUUDDDUUUDUUUUDUUDUDUDUUDUUDDDUDDUDDDDDDDUUDDUDDDDDUDUDDDUUDUDUDDUUUUUUDDUDDDDUDUDDDUDDDUUUUDDDDDDDUUDDDDUDUDUDDUUDDUUDUUDUUDDDUUUDDDDUDDDUDUDUDUUUDUDUDUDUUUUDDDUUDUUUUDUUDDUUDUDUDDUDDDDUUDDDDUDDUUUDUUDUDDDUUUDUUDDDUDUDUUDUUUUUDDDUUUUUDDDUUDDUDDDUUUUUUUUDDDUUDUDUUDUUDUDUUDDDDDUUUUDUDDUUUDUDDDDUUDUUUDUUUDDDDUUDDUUDUUUDDUDDUDDUDDUUDDDUDUUUUUUUDDDUDUDDUUUUUDDUDUDDDDDUDDDUDUDUDDDDDDDDUUDDUDUUUUDUUUDUUDDUUUDDDUUDUUDDUDUDDUUUUUUUDDUDDUDUDDDUUDUUUDDUUDDDDUUUUUDDUUDDDUUUDDDUUDDDDDUDUUUDDUDUDDUDDUUDDDDDUUUUDUDUUUUUUDUUDUUUDDUUUUUUDDDDUDUDUUDUDDDUUDDDUUUUUDDDDDUDUDDDDDUUDDDUDUUUDDDUUUUDDUUUUUUUDUDDUUDDUDDDDDDDDDDDUDUDUUDDDDUDUUUDUDUUDUUUDDDDDUUDUDUUUDDUDUUUUDDUUDDUDDUDUUUDDUDUUDUDUUDDDDDDUUDUDDDUUUUDDDDUUUUUDDUUUDUUDUUDUUUUDDUDDUDDUDUUUDDUDDDDDUUDDUDUUDUUDUUDUDUUDDUUDUDUUUUDUUDDDDUUDDUUDUUUDDUUUDUDDUUUUUUUUUUUUUUUUUUUUUUUU"))


/*:
# Jumping Clouds
## Easy
*/
// Complete the jumpingOnClouds function below.
func jumpingOnClouds(c: [Int]) -> Int {
    let maxJumpRange = 2
    let minJumpRange = 1
    var numberOfJumps = 0

    var currentIdx = 0
    
    while currentIdx < c.count{
        print("cuurent index \(currentIdx)")
        let maxIndex = currentIdx + maxJumpRange
        let minIndex = currentIdx + minJumpRange
        
        if  maxIndex < c.count && c[maxIndex] == 0{
            print("max is good")
            currentIdx += maxJumpRange
            numberOfJumps += 1
        }else if minIndex < c.count && c[minIndex] == 0{
            print("min is good")
            currentIdx += minJumpRange
            numberOfJumps += 1
        }else if currentIdx - 1 == c.count{
            print("in 3")
            return numberOfJumps
        }else{
            print("return")
            break
        }
    }

    return numberOfJumps
}
//print(jumpingOnClouds(c: [0,0,0,0,1,0]))



/*:
# Repeating String
## Easy
*/

/*
Terminated due to timeout
*/
func repeatedString(s: String, n: Int) -> Int {
    let magicLetter = "a"
    let repeatNTimes = ceil(Double(n)/Double(s.count))
    print(repeatNTimes)
    let completeString = String(repeating: s, count: Int(repeatNTimes))
    print(completeString)
    let index = completeString.index(completeString.startIndex, offsetBy: n)
    let subString = completeString[..<index]
    print(subString)
    let charArray = Array(subString)
    let numbOfMagicLetter = charArray.filter( { $0.lowercased() == magicLetter }).count
    return numbOfMagicLetter
}



/*:
# Repeating String
## Easy
*/
func repeatedString(s: String, n: Int) -> Int {
    let magicLetter = "a"
    
    let numberInString = Array(s).filter( { $0.lowercased() == magicLetter} ).count

    let repeatNTimes = Int(floor(Double(n)/Double(s.count)))
    var total = numberInString * repeatNTimes

    if s.count % n != 0{
        let totalCount = s.count * (repeatNTimes+1)
        let removeNNumber = totalCount - n;

        let index = s.index(s.startIndex, offsetBy: s.count - removeNNumber)
        let subString = s[..<index]
        let numberInRemander = Array(subString).filter( { $0.lowercased() == magicLetter} ).count
        
        total += numberInRemander
    }
    return total
}

//print(repeatedString(s: "aaa", n: 10))

