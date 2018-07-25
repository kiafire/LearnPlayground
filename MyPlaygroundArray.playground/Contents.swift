//: Playground - noun: a place where people can play

import UIKit


var dReverse = ["a","&","b", "c",",","d"]


// 1 way coulbd be - create a dictionary with Special charcters and its index
// Reverse the array
//Add the special Characters back

// Other way. Copy the array on temp
// reverse the array
// Replace the spl characters on the same positon


func reverseWithoutAffectingSpl (reverseArray :[String]) -> [String]
{
    
    var charSet = CharacterSet.alphanumerics
    
    
    reverseArray.reduce([String:Int]) { (dict, x)  in
        if(charSet.contains(x.))
        {
            
        }
    }
    
    reverseArray.forEach { (x) in
        return x
    }
    
    return []
}
