//
//  Recursion_assignment1_evaluate.swift
//  Algorithm&DataStructures
//
//  Created by Yumi Machino on 2021/03/09.
//

import Foundation

/* 5. evaluate
  - recursive function evaluate that accepts a string representing a math expression and computes its value.
 - The expression will be 'fully parenthesized' and will consist of + and * on single-digit integers only.
 - You can use a helper function. (Do not change the original function header)
 - Recursion
 
 
 evaluate("7") -> 7
 evaluate("(2 + 2)") -> 4
 evaluate("1+ (2*4))") -> 9
 evaluate("((1+3)+((1+2)*5))") -> 19
 */

func evaluate(expression: String) -> Int {
    /// change let to var
    var strExpression = expression
    /// best case
    if strExpression.count == 0 || strExpression.count == 1 {
        let intValue: Int = Int(expression) ?? 1
        return intValue
    }
    /// end case without parentheses
    if !strExpression.contains("(") && !strExpression.contains(")") {
        let intValue = calc(stringExpression: strExpression)
        return intValue
    }
    /// end case with parentheses
    if strExpression.prefix(1) == "(" && strExpression.suffix(1) == ")" {
        let subString = strExpression[1, strExpression.count - 1]
        if !subString.contains("(") && !subString.contains(")") {
            let intValue = calc(stringExpression: subString)
            return intValue
        }
    }
    
    var index = 0
    for char in strExpression {
        index += 1
        if char == "(" {
            if strExpression[index + 3, index + 4] == ")" {
                let subString = strExpression[index, index + 3]
                let intValue = calc(stringExpression:subString)
                let str = String(intValue)
                /// replace calc to sum
                strExpression = strExpression.replacingOccurrences( of: strExpression[index - 1, index + 4], with: str)
                /// recursive
              return evaluate(expression: strExpression)
            }
        }
    }
    return 1
}
 

/// Helper function: calculate from string expression
func calc(stringExpression: String) -> Int {
    var signIndex = 0
    var index = 0
    for char in stringExpression {
        if char == "+" {
            signIndex = index
            guard let left = Int(stringExpression[0, signIndex]) else {return 0}
            guard let right = Int(stringExpression[signIndex + 1, stringExpression.count]) else {return 0}
            
            return left + right
        } else if char == "*" {
            signIndex = index
            guard let left = Int(stringExpression[0, signIndex]) else {return 0}
            guard let right = Int(stringExpression[signIndex + 1, stringExpression.count]) else {return 0}
            
            return left * right
        }
        index += 1
    }
    return 0
}
