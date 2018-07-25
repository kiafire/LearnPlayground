//: Playground - noun: a place where people can play

import UIKit

var str = ""


var statusCode = 400

var name :String

name = "Aejaz"
name = "Ahmed"


//Switch Case

switch statusCode {
case 200...399: // I can provide range
    print("I can provide range on my statement is my \(statusCode)")
    
case let mystatus where mystatus > 399 && mystatus < 500 :
    print("my status \(mystatus), NOTE there is no curly braces in my switch (remember closures)")
    fallthrough // control transfer to next statement
    
default:
    print("status code not in my list, default statement makes my switch exhaustive")
}

var testStr: NSString?
testStr = "optional string"
//Optional Binding
if let testUnwrap = testStr {
    print(testUnwrap)
}
print (testStr!) // forced Unwrapping

var testEmptystr = ""
print("my string is\(testEmptystr)! \(testEmptystr.isEmpty)")

//if-case and it concentrates on a signle case, adv -No default stament

if case 200...400 = statusCode
{
    print("\(statusCode) I dont need to be exhaustive ")
}

//Swift is a strongly typed language, you cannot add values that are different. If type is unspecified, first object type would be type inferred.
// heterogeneous collection literal could only be inferred to '[Any]'; If you domt specify Stick to Type Inference
//var testArray1 :Array = ["test",1,"value"]
var testArray :Array<String> = []
testArray.append("test")
//testArray.append(1)
testArray.append("Value")

print(testArray)

// heterogeneous collection literal could only be inferred to '[Any]'; If you dont specify stick to type inference
//Note comma is allowed after the last element
var testArray1 :Array<String> = [] // ["test","value",]
testArray1.append("test")
//testArray1.append(1)
testArray1.append("Value")
print(testArray1)

//Equality cannot be performed on an Array with type [Any] or type Inference( if initilization is empty)
let equal = (testArray == testArray1)

if equal
{
    print("Array is an ordered collection and will equate to tru if elemnts are in same order")
}
//Decleartion cannot be without type - And Dictionary "Key" should be hashable - String,Int,Float,Bool.
var myDict :Dictionary <Bool,String> = [:]
myDict.updateValue("its false", forKey: false)
myDict.updateValue("its true", forKey: true)
myDict.updateValue("its No", forKey: false)

print("Dictionary Values are : \(myDict)")

myDict.updateValue("its Yes", forKey: true)
myDict[true] = nil
print("Dictionary Values are : \(myDict)")

var myDict1 :Dictionary <Bool,String> = [:]
myDict1.updateValue("its true", forKey: true)
myDict1.updateValue("its false", forKey: false)
//myDict1[true] = nil
print(myDict1)

if myDict == myDict1{
    print("elements are equal")
}

//MARK functions
//Default Values is provided next to type
func sendPersonalGreetings(to name:String = "Ajay")
{
    print("Hello \(name) Lets rock with Swift functions")
}

sendPersonalGreetings(to: "Janani")

//Variadic Parameters - This can take zero or multiple Values and is denoted by "..."

func sendPersonalGreetings(to name:String...)
{
    for customer in name {
         print("Hello \(customer) Lets rock with Swift functions veriadic")
    }
}

sendPersonalGreetings(to: "Ankit","Vimal","Lakshman")

//MARK Default values - Variadic parameters cannot take default values or be inout parameters
sendPersonalGreetings()

//MARK InOut Parametrs - They modify the arguments and retun them back outside the functions scope.
//InOut Parameters cannot have default values or variadic parameters !
var testImnOut = "InOutValue"
//Also "&" adress has to be specified in the argument, "inout" is wrote before the arg type
func updateCustomerName( to name: inout String)
{
    name = "Mr.\\s \(name)"
}

print(testImnOut)

updateCustomerName(to: &testImnOut)
print(testImnOut)

//MARK Guard Statements - Provides early exit from a function if condition is not met.

func greetby( firstName fName:String, middleName mNAme:String, lastName lName:String) -> String
{
    //Use let to indicate
    guard fName.count>5, mNAme.count>8 else {
        return "Fnu"
    }
    
    guard mNAme.count==0 else {
        return fName + lName
    }
    
    return fName+" "+mNAme+" "+lName
}

greetby(firstName: "Aejaz", middleName: "Kalambur", lastName: "Iqbal")


var nameStr = "this is  captured inside closure"
/*
 
 Closures are of -
 
 { (argumnets) ->  returnType in ststaeemts }
 
 */
var myClosure = {
    [nameStr] in
    print(nameStr)
}

nameStr = "this is not captured inside closure"

myClosure()


//Defer - Multiple defers are invoked through Last In First Out order

func checkDefer()
{
    defer {
        print("My 1st defer")
    }
    
    defer {
        print("My 2nd defer")
    }
    
    print("Testing defers")
}


checkDefer()


// Palindrome : Reversing a String is the same as actual String

func isPalindrome(actualStr : String) -> Bool
{
    let reveresedStr = actualStr.reversed()
    
    if String(reveresedStr) == actualStr {
        return true
    }
    
    return false
    
}

print(isPalindrome(actualStr: "rotator")) // True - Case Sesnsitive

print(isPalindrome(actualStr: "roTator")) // False - Case Sesnsitive (Note the "T")

//Find out the count of a specific character in a given string

func countOf(character check:Character, inWord actaulString:String) -> Int
{
    var count = 0;
    
    actaulString.forEach { if $0 == check{ count+=1 }} // count++ will throw an error - Unary Operator cannot be applied to Operand, ++ is removed in Swift 3.
   return count;
}

print(countOf(character: "p", inWord: "happy"))


//Reversing a String without a predefined higer order function

func reverse(rString:String)-> String
{
    var reversedStr = ""
    rString.forEach { reversedStr.insert($0, at: reversedStr .startIndex)
    }
    return reversedStr
}
print(reverse(rString: "backward")) // drawkcab
print(reverse(rString: "This is backward")) // drawkcab si sihT

//Reverse based on words not the complete sentense.

func reverseEveryWord(inSentence: String) ->String
{
    var reversedStr:Array<String> = []
    inSentence.components(separatedBy:" ").forEach { reversedStr.append(reverse(rString: $0))
    }
    return reversedStr.joined(separator: " ")
}

print(reverseEveryWord(inSentence: "This is backward")) // sihT si drawkcab

//Using reduce function

var sumUp = [5.0,10.0,12.0]
print(sumUp.reduce(0.0) { $0 + $1}) //Prints the Sum 27.0
print(sumUp.reduce(0.0, +)) //Prints the Sum 27.0

//Combining Map, Fileter/Reduce
// Let’s say we have a class of students, and of each student you know their birth year. You want to sum the ages of all students born in or after the year 2000

let years = [1989, 1992, 2003, 1970, 2014, 2001, 2015, 1990, 2000, 1999]
//Filter Out the Array
//Use Map to calculate the age of the student today in 2017
//Reduce the Array by Summing up
var rsult = years.filter { $0>2000}.map{2017-$0}.reduce(0,+)
print(rsult)

let string:String = String(describing: String.self)
print(string)

enum Planet: Int{
    case Mercury = 1
    case Venus
    case Earth
    case Mars
}

let test = Planet(rawValue:3)

var first = [1,2,3]
var second = ["one","two","three"]
var third = Array(zip(first,second))
print(third)

let (captain,engineer,doctor) = ("mal","kailee","simon")

print(engineer)


var names = [String]()
names.append("Amy")
let ex1 = names.removeLast()
//let ex2 = names.removeLast()

//let data: [Any?] = ["Bill", nil, 69, "Ted"]
//
//for datum in data where datum is String? {
//    print(datum)
//}
//
//for case let .some(datum) in data where datum is String {
//    print(datum)
//}


func greet(name: inout String) {
    name = name.uppercased()
    print("Greetings, \(name)!")
}

var n = "River"
greet(name: &n)

let names1 = ["Pilot": "Wash", "Doctor": "Simon"]

for (key, value) in names1.enumerated() {
   print(key)
    print(value)
}


//Undersatnding protocols and protocol Extensions

//This is how you declare a protocol
protocol ErrorHandler {
    // Protocol Declares a method
    /* If this is not decalred, the correct implementation will not be invoked */
   func handle(error: Error)
}


//This is a protocol extensionm
extension ErrorHandler {
    // Protocol provides a default implementation
    func handle(error: Error) {
        print("Default Implementation is invoked :\(error.localizedDescription)")
    }
}

// Struct conforming to a Protocol Extension
struct SubHandler: ErrorHandler {
    //Method gets overridden in Handler Implementation
    func handle(error: Error) {
        print("Unexpected error occurred in SubHandler Struct: \(error.localizedDescription)")
    }
}

enum ApplicationError: Error {
    case other
}


let handler:ErrorHandler = SubHandler() // Here type is different than the original instance
handler.handle(error: ApplicationError.other)

/* Method is not decalred in Protocol ErrorHandler:
    The handler.handle invokes the default implementation in ErrorHandler (because of the type declartion), since SubHandler cannot override an undecalred protocol method.
 
    Method is decalred in Protocol ErrorHandler:
    The handler.handle invokes the overriden implementation in SubHandler, since SubHandler Can override an Decalred protocol method. The correct implementation is invoked regardless of the type of variable.
 
 No Defalt Implementation : Goes to SubHandler and forces SubHandler to iomplement the protocol
 Default Implementation Provided and no overridong  : Treats the protocol as optional
 */



protocol WebErrorHandler
{
    func handle(error:Error)
}

extension WebErrorHandler
{
    func handle(error:Error)
    {
        print("Web Hanlder handles error : \(error.localizedDescription)")
    }
}
//If the class conforms to two different protocols having the same name , there is a conflict of interest and the class has to define its own implementation.
// It will not use the default implementation of either of the class
struct MultiErrorHandler : WebErrorHandler,ErrorHandler
{

    func handle (error:Error)  {
        print("Multi Error Handler Handle Block");
    }
}

let multiProtoTest :WebErrorHandler  = MultiErrorHandler()
multiProtoTest.handle(error: ApplicationError.other)


//PowerSet


extension Array {
    //["A", "B", "C", "D"]
    var powerset: [[Element]] {
        guard count > 0 else {
            return [[]]
        }
        
        // tail contains the whole array Except the first element ["B", "C", "D"]
        let tail = Array(self[1..<endIndex])
        print(tail)
        
        // head contains only the first element [A]
        let head = self[0]
        
        // computing the tail's powerset
        let withoutHead = tail.powerset
        
        // mergin the head with the tail's powerset
        let withHead = withoutHead.map { $0 + [head] }
        
        // returning the tail's powerset and the just computed withHead array
        return withHead + withoutHead
    }
}

let myArray = ["A", "B", "C", "D"]
print(myArray.powerset) // -> [["D", "C", "B", "A"], ["C", "B", "A"], ["D", "B", "A"], ["B", "A"], ["D", "C", "A"], ["C", "A"], ["D", "A"], ["A"], ["D", "C", "B"], ["C", "B"], ["D", "B"], ["B"], ["D", "C"], ["C"], ["D"], []]

print(myArray.powerset.joined())
// joining the subsets
let myResult = myArray.powerset.map { $0.sorted().joined()}
print(myResult) // -> ["A", "AB", "ABC", "ABCD", "ABD", "AC", "ACD", "AD", "B", "BC", "BCD", "BD", "C", "CD", "D", ""]


//PowerSet

/*Given a smaller string s and a bigger string b, design an algorithm to find all permutations of the shorter string within the longer one. Print the location of each permutation.
 
 s: abbc
 b: cbabadebbabbebabaabcebabe
 
 

func permutate(strLine : String)
{
 
    var myResultsArray : [String] = []
    
    
    func heapReplace(count: Int)
    {
        if(count == 1)
        {
            myResultsArray.append(strLine)
        }
        else
        {
            
            for char in strLine {
                var testChar = c
            }
            
        }
    }
    
    heapReplace(count: strLine.count)
}
*/


extension Array {
    
    var powerSetter :[[Element]] {
        guard count>0 else {
            return [[]];
        }
        
        let headEle = self[0]
        
        let tileEle : [Element] = Array(self[1..<self.endIndex])
        
        let nextWithHead = tileEle.powerSetter
        
        let currentWithHEad = nextWithHead.map { $0 + [headEle] }
        
        return currentWithHEad+nextWithHead
    }
    
}


let myArrayT = ["A", "B", "C", "D"]
print(myArrayT.powerSetter) // -> [["D", "C", "B", "A"], ["C", "B", "A"], ["D", "B", "A"], ["B", "A"], ["D", "C", "A"], ["C", "A"], ["D", "A"], ["A"], ["D", "C", "B"], ["C", "B"], ["D", "B"], ["B"], ["D", "C"], ["C"], ["D"], []]

// joining the subsets
let myResultT = myArrayT.powerset.map { $0.sorted().joined()}
print(myResultT) // -> ["A", "AB", "ABC", "ABCD", "ABD", "AC", "ACD", "AD", "B", "BC", "BCD", "BD", "C", "CD", "D", ""]


//Unique Characters


func LetterChanges(_ str: String) -> String {
    
    // code goes here
    // Note: feel free to modify the return type of this function
    
    var strn = str.components(separatedBy: " ")
    
    strn = strn.map {  $0.capitalized }
    
    return strn.joined(separator: " ")
    
}

print(LetterChanges("i ran there"))


// [1,1,2,4]

// [1,1,3,4]

// for Corrcet Position Correct Color - CCCP
// for Corrcet Color Wrong Position - CCWP

func validate(correct: [Int] , guessed : [Int]) ->(Int, Int)
{
    var resultTuple : (Int, Int) = (0,0)
    for (index,ele) in correct.enumerated()
    {
        if ele == guessed [index]
        {
            print("Correct Position",index," Correct Color",ele)
            resultTuple.0 = resultTuple.0+1
        }
        else
        {
            let ind = correct.contains(guessed [index])
            if(ind){
                print("Correct color Wrong Position", ele, ind);
                resultTuple.1 = resultTuple.1+1
            }else{
                print("Element Not found")
            }
        }
        
    }
    return resultTuple
}

let result = validate(correct:[1,1,2,4] , guessed: [1,1,3,4])

print("Final  CCCP", result.0 , "CCWP", result.1)



class Node{
    var value : Int
    var next : Node?
    
    init(value:Int, next:Node?) {
        self.value = value
        self.next = next
    }
}

//1->2->3->nil

var three = Node.init(value: 3, next: nil)

var secondNode = Node.init(value: 2, next: three)

var oneNode = Node.init(value: 1, next: secondNode)

func printLinkdList(node:Node?)
{
    var currentNode = node
    
    while currentNode != nil {
        print("\(currentNode?.value ?? -1)"+"->")
        currentNode = currentNode?.next
    }
}

printLinkdList(node: oneNode)


//       1->2->3->nil
// Prev > Current -> Next
// nil <- 1 - >2->3-> nil
// nil <-1 <-2 -> 3->nil
// nil <-1 <-2 <-3

func reverseLinkdList (list :Node?) -> Node?
{
    var currentNode = list
    
    var nextNode :Node?
   
    var previousNode :Node? //nil
//1
    while currentNode != nil {
        
        nextNode = currentNode?.next
        
        currentNode?.next = previousNode
        
        previousNode = currentNode
        
        currentNode = nextNode
    }
    
    return previousNode
}

printLinkdList(node:  reverseLinkdList(list: oneNode))
