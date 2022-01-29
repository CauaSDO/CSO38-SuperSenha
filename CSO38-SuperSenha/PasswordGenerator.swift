//
//  PasswordGenerator.swift
//  CSO38-SuperSenha
//
//  Created by caua on 27/01/22.
//

import Foundation

class PasswordGenerator {
    
    
    var numberOfPasswords: Int
    var numberOfCharacters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialLetters: Bool

    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%ˆ&*()_-+=˜`|]}[{':;?/<>.,"
    private let numbers = "0123456789"
    
    init(numberOfPasswords: Int, numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialLetters: Bool) {
        
        var numchars = min(numberOfCharacters, 16)
        numchars = max(numchars, 1)
    
        self.numberOfPasswords = numberOfPasswords
        self.numberOfCharacters = numchars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialLetters = useSpecialLetters
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useSpecialLetters {
            universe += specialCharacters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            password.append(password)
        }
        
        return passwords
    }
    
}
