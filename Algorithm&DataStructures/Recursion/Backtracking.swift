//
//  Backtracking.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/03/11.
//

import Foundation

/*
 Backtracking
    - "Exhaustive search with some constraints"
    - involve looking for One solution or All solutions
 Applications:
    - parsing languages
    - escaping from a maze
    - games: anagrams, crosswords, 8 queens .... 
 */


// Exhaustive case

/// Print all possible combinations of values that could appear on the dice
/// - Parameter n: the number of dice
/// if n = 2, [1,1], [1,2].....[6,6]
func rollDice(_ n: Int) {
    var choices = [Int]()
    rollDiceHelper(n, choices: &choices)
}

func rollDiceHelper(_ n: Int, choices: inout [Int]) {
    if n == 0 {
        print(choices)
    } else {
        for i in 1...6 {
            // choose one
            choices.append(i)
            // explore
            rollDiceHelper(n - 1, choices: &choices)
            // un-choose one
            choices.removeLast()
        }
    }
}

// Backtracking case

/// Write a function rollDiceSum similar to rollDice, but it also accepts a desired sum and prints only permutations that add up to exactly that sum.
/// - Parameters:
///   - n: the number of dice
///   - desiredSum: desired sum
/// Example: rollDiceSum(n: 2, sum: 5)
///       [1,4],[2,3], [3,2], [4, 1] *you can print as arrays
func rollDiceSum(_ n: Int, desiredSum: Int) {
        
}

func rollDiceSumHelper(n: Int, desiredSum: Int, soFar: Int, choices: inout [Int]) {
  if n == 0 {
    if desiredSum == soFar {
      print(choices)
    }
  } else {
    for i in 1...6 {
      // choose i, and the remaining desired sum should be between 1 * (n-1) <=   <= 6 * (n-1)
      if soFar + i + (n - 1) * 1 <= desiredSum && desiredSum <= soFar + i + (n - 1) * 6 {
        choices.append(i)
        rollDiceSumHelper(n: n - 1, desiredSum: desiredSum, soFar: soFar + i, choices: &choices)
        choices.removeLast()
      }
    }
  }
}


