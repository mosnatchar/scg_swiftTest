import Foundation

//if let index = findEquilibriumIndex(arr: [1,4,2,5,0]) {
//            print("middle index is \(index)")
//        } else {
//            print("index not found")
//        }
    
func findEquilibriumIndex(arr: [Int]) -> Int? {
    let totalSum = arr.reduce(0, +)
    var leftSum = 0
    
    for (index, value) in arr.enumerated() {
        let rightSum = totalSum - leftSum - value
        if leftSum == rightSum {
            return index
        }
        leftSum += value
    }
    
    return nil
}
