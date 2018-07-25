//: Playground - noun: a place where people can play

import UIKit

public final class LinkedList<T>
{
    
    public class LinkedListNode<T>
    {
        var value:T //Value the node holds
        
        //Previous Node
        var  previousNode :LinkedListNode?
        
        /*Both Previous and NExt Node holding each other will become cyclic reference so , making one weak */
        //Next Node
        weak var nextNode :LinkedListNode?
        
        
        public init (value:T)
        {
            self.value = value;
        }
        
        convenience init(value:T , nextNode :LinkedListNode? , previousNode:LinkedListNode?) {
            
            self.init(value: value)
            self.previousNode = previousNode
            self.nextNode = nextNode
        }
        
        //Functions We need
    }
    
    //Using TypeAlias to refer LinkedListNode as Node
    
    typealias Node = LinkedListNode<T>
    
    //Head Points to start of the list
    fileprivate var head : Node?
    
    //Tail Points to end of the list
    fileprivate var tail : Node?
    
    //The Node itself
    fileprivate var node : Node?
    
    //Count of the List
    fileprivate var count : Int
    
    //Check to see if the List is Empty
    public var isEmpty :Bool {
        return head == nil // if head is nil there is no list
    }
    

    
}

