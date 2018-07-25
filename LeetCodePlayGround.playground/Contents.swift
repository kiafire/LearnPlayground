//: Playground - noun: a place where people can play

import UIKit

//Problem 1
//Given an array of integers, return indices of the two numbers such that they add up to a specific target

// If sorted Array
func findtheCombination(given:[Int], target:Int) -> (Int,Int)?
{

    var startIndex = 0
    var topIndex = given.count-1
    var  total = 0
    
    repeat
    {
        total = given[startIndex] + given [topIndex]
        if( total == target )
        {
            break;
        }
        else if(total > target)
        {
            topIndex = topIndex-1;
        }
        else
        {
            startIndex = startIndex+1;
        }
        
    } while(startIndex != topIndex)
   
    if startIndex == topIndex {
        return nil
    }
    
   return (startIndex,topIndex)
}

 findtheCombination(given: [7,11,1,15], target: 9)



func twoSum(_ nums: [Int], _ target: Int) -> [Int]
{
    //Create a dictionary where indexs are stored
    var dict = [Int: Int]() // Key is Number, Index is Value
    
    //Iterate through numbers array
    
    for (i, num) in nums.enumerated() {
        
        if let lastIndex = dict[target - num] {
            return [lastIndex, i]
        }
        //Add the expected value to dictionary
        dict[num] = i
    }
    
    fatalError("No valid outputs")
}

twoSum([3,2,4], 6)



func twoSumWithMap(_ nums: [Int], _ target: Int) -> [Int]
{

    for (i, num) in nums.enumerated() {
        
        var d = target-num
        
        if let lastIndex = nums.index(of: d), i != lastIndex{
            return [i,lastIndex]
        }
        //Add the expected value to dictionary
    }
    
    fatalError("No valid outputs")
}

twoSumWithMap([3,2,4], 6)


/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */


//class Solution {

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        
        public init(_ val: Int)
        {
            self.val = val
            self.next = nil
        }
    }
    
    // 2-> 4-> 3
    // 5-> 6-> 4
    // 7-> 0-> 8
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
       
        if let link1 = l1 ,let link2 = l2 {
            
            let a = link1.val + link2.val
            
            let p =  ListNode.init(a%10)
            
            p.next = addTwoNumbers(link1.next,link2.next);
            
            if (a >= 10)
            {
                p.next = addTwoNumbers(p.next,ListNode(1))
                
            }
          return p
        }
        return nil
}

var d1 = ListNode(2)
var d2 = ListNode(4)
d1.next = d2
var d3 = ListNode(3)
d2.next = d3

var c1 = ListNode(5)
var c2 = ListNode(5)
c1.next = c2
var c3 = ListNode(4)
c2.next = c3


//addTwoNumbers(d1, c1)
//}
/*
 
 Given "abcabcbb", the answer is "abc", which the length is 3.
 
 Given "bbbbb", the answer is "b", with the length of 1.
 
 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 

 
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    
    var max = 1
   // let tempstr = String(s)
    var charc : [Character] = []
    
    if(s.isEmpty)
    {
        return 0
    }
    
    for i in s.indices
    {
        charc.append(s[i])
        for j in s.indices where j>i
        {
              //  print(s[j],charc, charc.contains(s[j]))
                if(charc.contains(s[j]))
                {
                    charc.removeAll()
                  //  print(charc)
                    break;
                }
                else
                {
                    charc.append(s[j])
                    if(charc.count > max)
                    {
                        max = charc.count
                    }
                }
            
        }
    }
    return max
}

lengthOfLongestSubstring("pkeww")

123%10

123/10

func reverse(_ x: Int) -> Int {
    
    var result = 0;
    var y = x;
    
    while(y != 0){
        result = result * 10 + y % 10;
        y = y / 10;
    }
    
    if (y > Int.max) {
        y = 0 ;
    }
    if(y < Int.max)
    {
        y = 0;
    }
    
    return result;
}

reverse(-243)

func singleNumber(_ nums: [Int]) -> Int {

    var elementArray = [Int:Int] ()
    
   for(index,ele) in nums.enumerated()
    {
        if(elementArray.keys.contains(ele))
        {
            elementArray[ele] = elementArray[ele]!+1
        }
        else
        {
            elementArray[ele] = 1
        }
        
    }
    
    return (elementArray.min(by: { (x, y) -> Bool in
        x.value<y.value
    })?.key)!
}

singleNumber([5,5,10,4,5,10,3,4,4,2,3])


func singleNumberWithReduce(_ nums: [Int]) -> Int {
    

    return 0;
    
}
/*Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 
 For example, given nums = [0 , 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
 
 Note:
 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.*/
//Think of this solution as
// Can we remove and append at end index, this can corrupt the for loop index. so avoid it
//Approach to follow.
//1. Index is the problem, so lets have a variable to hold non zero indexes
//2. When u find a non zero # update the value in the first non zero index and increment
//3. At the end, you would have copied the values non zero values on the
func moveZeroes(_ nums: inout [Int]) {
    
    //this is the index of nonzero elements , a seperate index is maintained
    var idxForNonZero = 0
    
    for (element) in nums {
        if(element != 0)
        {
            nums[idxForNonZero] = element
            idxForNonZero += 1
        }
    }
    
    while idxForNonZero < nums.count {
        print(nums[idxForNonZero],idxForNonZero)
        nums[idxForNonZero] = 0
        idxForNonZero += 1
    }
    
}

var nums = [0,0,1]
 moveZeroes(&nums)

func plusOne(_ digits: [Int]) -> [Int] {
    
    for var (index,ele) in digits.enumerated()
    {
        ele += 1
        
        if ele>9 {
            
            digits [index] =
        }
    }
    
    return []
}
