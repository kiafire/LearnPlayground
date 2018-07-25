//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Find the vertical sum of a binary tree

/*
            1
           / \
         2     3
        / \   / \
       4   5 /   6
            7
 
 // Lets create a hash map
 
 HashMap | Element
 0  | 1
 -1 | 2
 -2 | 4
 1  | 3
 2  | 6
 0  | 5
 0  | 7
 
 Basically -1 on the letft side and +1 on the right

 */

//Structs don't allow to reference itself.
class Node
{
    var value:Int
    var left :Node?
    var right :Node?
    
    init(value : Int, left:Node?, right:Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    convenience init(value:Int) {
        self.init(value: value, left:nil, right:nil)
    }
}


var sevenNode = Node.init(value: 7)

var sixNode = Node.init(value: 6)

var threeNode  = Node.init(value: 3, left: sevenNode, right: sixNode)

var fourNode = Node.init(value: 4)

var fiveNode = Node.init(value: 5)

var twoNode = Node.init(value: 2, left: fourNode, right: fiveNode)

var oneNode = Node.init(value: 1, left: twoNode , right: threeNode)


func printVerticalSum(node:Node, distance:Int, sumDict: inout Dictionary<Int,Int>)
{
    if let previosu = sumDict[distance]
    {
        sumDict[distance] = previosu + node.value
    }
    else
    {
        sumDict[distance] =  node.value
    }
    
    if let left = node.left  {
         printVerticalSum(node: left, distance: distance-1, sumDict:&sumDict)
    }
   
    
    if let right = node.right   {
           printVerticalSum(node: right, distance: distance+1, sumDict:&sumDict)
    }
}

var sumDict = Dictionary<Int,Int>()
printVerticalSum(node: oneNode, distance: 0, sumDict: &sumDict)

print(sumDict)



//Find Maximum Width of the tree


func findMaxWidth (root:Node) -> Int
{

    
    var queue : Array = [root];
    
    if(queue.count > 1)
    {
        return (queue.count);
    }
    return 0;
}



var root = oneNode;

func recursiveFindLength(root:Node?) -> Int
{
    var max = 1;

    var temp = 0;
    
    
    if let ele = root?.left
    {
      temp +=  findMaxWidth(root: ele)
    }
    
    if let ele = root?.right
    {
        temp += findMaxWidth(root: ele)
    }
    
    if temp > max
    {
        max = temp
    }
    
    return max
    
}

print(recursiveFindLength(root: oneNode))
