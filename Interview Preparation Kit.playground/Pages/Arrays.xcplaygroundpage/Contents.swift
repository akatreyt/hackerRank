/*:
 # 2D Array - DS
 ## Easy
 */
import Foundation


// Complete the hourglassSum function below.
func hourglassSum(arr: [[Int]]) -> Int {
    let middleOffset = 1
    let endOffset = 2
    
    var value = [Int]()
    
    for r in 0..<arr.count-endOffset{
        let middleRow = r + middleOffset
        let endRow = r + endOffset
        
        let numOfColumns = arr[r].count
        for i in 0..<numOfColumns-endOffset {
            let middleIdx = i + middleOffset
            let endIdx = i + endOffset
            
            let topArray = arr[r]
            let topSlice = [topArray[i], topArray[middleIdx], topArray[endIdx]]
            
            let middleArray = arr[middleRow]
            let middleSlice = [middleArray[middleIdx]]
            
            let bottomArray = arr[endRow]
            let bottomSlice = [bottomArray[i], bottomArray[middleIdx], bottomArray[endIdx]]
            
            let allValues = [topSlice, middleSlice, bottomSlice].flatMap({ $0 })
            let sum = allValues.reduce(0, +)
            value.append(sum)
        }
    }
    let sorted = value.sorted(by: >)
    let max = sorted.first ?? 0
    return max
}

let input0 = [[1,1,1,0,0,0],[0,1,0,0,0,0],[1,1,1,0,0,0],[0,0,2,4,4,0],[0,0,0,2,0,0],[0,0,1,2,4,0]] // 19
let input1 = [[-9,-9,-9,1,1,1],[0,-9,0,4,3,2],[-9,-9,-9,1,2,3],[0,0,8,6,6,0],[0,0,0,-2,0,0],[0,0,1,2,4,0]]

//print(hourglassSum(arr: input1))

/*:
 # Left Rotation
 ## Easy
 */
// Complete the rotLeft function below.
func rotLeft(a: [Int], d: Int) -> [Int] {
    let leftSlice = a[a.startIndex..<d]
    let rightSlice = a[d...a.endIndex-1]
    let newArray = rightSlice+leftSlice
    return Array(newArray)
}

let rotLeftInput0 = [1,2,3,4,5]
//print(rotLeft(a: rotLeftInput0, d: 4))

/*:
 # Minimun Swaps 2
 ## Medium
 */
// Complete the minimumSwaps function below.
/*
 Terminated due to timeout
 */
func minimumSwaps(arr: [Int]) -> Int {
    var numOfSwaps = 0
    var mutableArr = arr
    // count - 1 b/c after the sort the last value is the largest
    for i in 0..<mutableArr.count-1{
        let currentValue = mutableArr[i]
        let rightSplice = mutableArr[i+1...arr.endIndex-1]
        let rightSpliceSorted = rightSplice.sorted(by: <)
        
        if let smallestRight = rightSpliceSorted.first,
            smallestRight < currentValue,
            let smallIdx = mutableArr.firstIndex(of: smallestRight){
            mutableArr[smallIdx] = currentValue
            mutableArr[i] = smallestRight
            numOfSwaps += 1
            print("swapping \(currentValue) and \(smallestRight)")
        }
        print("mutableArr \(mutableArr)")
    }
    
    return numOfSwaps
}

let minSwapInput0 = [4,3,1,2]
let minSwapInput1 = [2,3,4,1,5]
let minSwapInput2 = [1,3,5,2,4,6,7]
//print(minimumSwaps(arr: minSwapInput0))



/*:
 # Array Manipulation
 ## Hard
 
 */
// Complete the arrayManipulation function below.
/*
 Terminated due to timeout
 */

func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    var array = Array(repeating: 0, count: n)
    
    for i in 0..<queries.count{
        let q = queries[i]
        
        if q.count == 3{
            let startIdx = q[0]-1
            let endIdx = q[1]-1
            let value = q[2]
            
            for i in startIdx...endIdx{
                let currentValue = array[i]
                let newValue = currentValue + value
                array[i] = newValue
            }
        }
    }
    
    // this is O(*n* log *n*) which could be really bad for huge data sets
    let sorted = array.sorted(by: >)
    return sorted.first ?? 0
}

let arrayManipulationInput0 = [[1, 2, 100], [2, 5, 100], [3, 4, 100]]
let arrayManipulationInput1 = [[1, 5, 3], [4, 8, 7], [6, 9, 1]]
//print(arrayManipulation(n: 10, queries: arrayManipulationInput1))

/*
 Terminated due to timeout
 */
func arrayManipulation2(n: Int, queries: [[Int]]) -> Int {
    var dict = [Int:Int]()
    for q in queries{
        if q.count == 3{
            let startIdx = q[0]
            let endIdx = q[1]
            let value = q[2]
            
            for i in startIdx...endIdx{
                let currentValue = dict[i] ?? 0
                let newValue = currentValue + value
                dict[i] = newValue
            }
        }
    }
    // this is bad b/c its O(n) instead of holding max value like below
    return dict.values.max() ?? 0
}

let arrayManipulation2Input0 = [[1, 2, 100], [2, 5, 100], [3, 4, 100]]
let arrayManipulation2Input1 = [[1, 5, 3], [4, 8, 7], [6, 9, 1]]
//print(arrayManipulation2(n: 5, queries: arrayManipulation2Input1))

/*
 from jorge and still timesout :(
 
 using bigDataSet
 Start jorge : 2020-03-14 20:56:27 +0000
 1000000
 End jorge : 2020-03-14 20:57:36 +0000
 
 */
func jorge(n: Int, queries: [[Int]]) -> Int {
    var dict = [Int:Int]()
    var maxValue = 0
    queries.forEach { (array) in
        if array.count == 3{
            for i in array[0]...array[1]{
                let currentValue = dict[i] ?? 0
                let newValue = currentValue + array[2]
                dict[i] = newValue
                
                if newValue > maxValue{
                    maxValue = newValue
                }
            }
        }
    }
    print(dict)
    return maxValue
}
let arrayManipulation2Input3 = [[2, 6, 8], [3, 5, 7], [1, 8, 1], [5, 9, 15]]

//print("Start jorge : \(NSDate.now)")
//print(jorge(n: 10, queries: bigDataSet))
//print("End jorge : \(NSDate.now)")

func test1(n: Int, queries: [[Int]]) -> Int {
    var maxValue = 0
    for idx in 0...n{
        let maxForIdx = queries.filter({
            let range = $0[0]...$0[1]
            return range.contains(idx)
            }).reduce(0, {
                $0 + $1[2]
            })
        if maxForIdx > maxValue{
            maxValue = maxForIdx
        }
    }
    return maxValue
}
print("Start test1 : \(NSDate.now)")
print(test1(n: 10, queries: arrayManipulation2Input3))
print("Start test1 : \(NSDate.now)")
