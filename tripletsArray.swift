// ข้อ 3
// let exampleArray = [-3, 1, 2]
 //        let triplets = threeSum(exampleArray)
 //        print("Triplets that sum to zero are: \(triplets)")

func threeSum(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        var result = [[Int]]()
        
        for i in 0..<nums.count-2 {
            if i > 0 && nums[i] == nums[i-1] {
                continue // Skip duplicates
            }
            
            var left = i + 1
            var right = nums.count - 1
            
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                
                if sum == 0 {
                    result.append([nums[i], nums[left], nums[right]])
                    
                    // Skip duplicates for left and right pointers
                    while left < right && nums[left] == nums[left + 1] {
                        left += 1
                    }
                    while left < right && nums[right] == nums[right - 1] {
                        right -= 1
                    }
                    
                    left += 1
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        
        return result
    }
