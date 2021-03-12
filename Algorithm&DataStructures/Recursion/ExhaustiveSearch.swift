//
//  ExhaustiveSearch.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/03/10.
//

import Foundation

/*
 Ehaustivev Search
 if: when there is no more decision to make -> STOP
 else: dicisions to make
 
 func Search(decisions):
    - For each availabe choice C for this decision:
        - Choose C by modifying parameters. (choice could be added to array or somthing) -> iterate over choice
        - Search the remaining decisions that could follow C. (recursive)
        - Un-choose C by returning parameters to the original state (if necessary) -> ex) remove last char so that another char can be added
        - Base Case: when out of decisions
 */


// MARK: - Print Binary: O(2^n)

//Time complexity -> O(2^n) (every function calls 2 function calls)
func printBinaryExhaustiveHelper(_ n: Int, _ soFar: String, _ indent: String = "") {
    print(indent + #function + "n = \(n), soFar = \(soFar)")
    if n == 0 {
        // no more choices to make -> stop
        print(soFar)
    } else {
        // more choices to make
        // for all available choices 0, 1
        // choose one
        for i in 0...1 {
            // recursively search for the next choice, add selected choice to the String
            printBinaryExhaustiveHelper(n - 1, soFar + "\(i)", indent + "  ")
        }
    }
}

///  printBinary(n): prints all binary representations for n digits
/// - Parameter n: the number of digits
func printBinaryExhaustive(_ n: Int) {
    printBinaryExhaustiveHelper(n, "")
}

// MARK: - Print Dicimal: O(10^n)

// Time Complexity -> (10^n) every function calls 10 function calls
func printDecimalEhaustiveHelper(_ n: Int, _ soFar: String = "") {
    /// base case
    if (n == 0) {
        // no more choices to make
        print(soFar)
    } else {
        // more choices to make
        // for all avaialble choices 0 ~ 9
        for i in 0...9 {
            // choose one & recursively search
            printDecimalEhaustiveHelper(n - 1, soFar + "\(i)")
        }
    }
}

func printDecimalExhaustive(_ n: Int)  {
    printDecimalEhaustiveHelper(3, "")
}


// MARK: - Permutation: O(n!)

func permutationHelper(_ word: String, _ soFar: String = "", _ indent: String = "") {
    print(indent + #function + "[word=\(word), sofar=\(soFar)]")
    if word.count == 0 {
        // no more characters to choose -> stop
        print(soFar)
    } else {
        for i in 0..<word.count {
            let c = word[i]
            // look for other char other than c (0 <= i, i + 1 < end)
            permutationHelper(word[0,i] + word[i + 1, word.count], soFar + c, indent + "  ")
        }
    }
}

/// Write a recursive function permutation that accepts a string as a parameter and outputs
/// all possible rearranements of the letters in the string.
/// - Parameter word: the string
func permutation(_ word: String) {
    var set = Set<String>() // HashSet
    permutationUnique(word, "", &set)
    for w in set {
        print(w)
    }
//    permutationHelper(word)
}

// inout -> pass as reference type instead of value type(prevent creating Set everytime function calls)
func permutationUnique(_ word: String, _ soFar: String = "", _ set: inout Set<String>) {
    if word.count == 0 {
        // at the end, store string to Set (so that it eliminates the duplicate)
        set.insert(soFar)
    } else {
        for i in 0..<word.count {
            let c = word[i]
            permutationUnique(word[0,i] + word[i+1, word.count], soFar + c, &set)
        }
    }
}


// MARK: - Exercise: Combinations

