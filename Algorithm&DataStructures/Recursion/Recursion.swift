//
//  Recursion.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/03/09.
//

import Foundation
/*
 Recursive algorithm works well with "self-similar"
  Need at least 2 cases:
     - Best case ('end point', easy answer)
     - Recursive case
*/

// MARK: - Examples
/// example 1)
func factorial(n: Int) -> Int {
    /// best case
    if n == 0 {
        return 1
    }
    /// recursive case
    return factorial(n: n - 1) * n
}

/// example 2)
func mystery(n: Int) -> Int {
    if n < 10 {
        return n;
    } else {
        let a = n / 10
        let b = n % 10
        return mystery(n: a + b);
    }
}
/// mystery(638); ----> 9


 // MARK: - Exercise
/// 1. power(base, exponent) -> base^exponent
/// Assume exponent >= 0
func power(base: Int, exponent: Int) -> Int {
    /// base case
    if exponent == 0{
        return 1
    }
    if exponent == 1 {
        return base
    }
    ///recursion case
    return base * power(base: base, exponent: exponent - 1)
}
/// Power(base: 2, exponent: 3) -> 2^3  => 2 * 2 * 2
/// --->  2 * 2^2



/// 2. isPalindrome(word): checks if a word is a palindrome
func isPalindrome(_ word: String) -> Bool {
    /// base case
    if word.count <= 1 {
        return true
    }
    /// recursive case
    /// "substring" s[start, end]
    /// word [1,5] -> "ello"
    /// word[0] -> "H"
    if let first = word.first, let last = word.last, first == last {
        // exclude first and last word
        return isPalindrome(word[1, word.count - 1])
    }
    return false
}
/* isPalindrome(word: "madam")
 ["madam"] -> check first and last
 ["ada"] -> check first and last */



/// 3. printBinary(n): prints binary form of given int n
func printBinary(_ n: Int) {
    /// if n is negative -> convert to positive
    if n < 0 {
        print("-", terminator: "") // print without newline
        printBinary(-n)
        print()
        return
    }
    /// base case: n == 0, n == 1
    if n < 2 {
        print(n)
        return  /// stop
    }
    /// Recursive case
    /*関数を呼んだところで、Call Stackに入る。best caseに行きreturn されたら順番にpopして、
     popされたらようやく元の関数に戻ってきて、下のprint関数を実行する。*/
     printBinary(n / 2)
     print(n % 2, terminator: "")
}


/// 4. reverseLines
/// - print all lines in reverse order (recursively) from a text file
/// - Parameter line: line number starting from 0
func reverseLines(_ line: Int){
    /// get the contents of the file
    let contents = try! String(contentsOfFile: "/Users/yumi/Documents/CICCC/Algorithm&DataStructures/provinces.txt", encoding: .utf8)
    
    /// convert contents to array [line1, line2,....]
    let lines = contents.split(separator: "\n")
    if line < lines.count {
        reverseLines(line + 1)
        print(lines[line])
    }
}

/* 最後の行からn 行目までをbackwardでprintする
 line とlines.countが同じ時(end point)、popし始める
 recursive callの後に何らかの処理を行う場合、実行される順番は逆の順番となる。
 */

