/*:
 # 2D Array - DS
 ## Easy
 */
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


/*:
 # Array Manipulation
 ## Hard
 
*/
