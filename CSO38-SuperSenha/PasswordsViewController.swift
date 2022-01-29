//
//  PasswordsViewController.swift
//  CSO38-SuperSenha
//
//  Created by caua on 27/01/22.
//

import UIKit

class PasswordsViewController: UIViewController {
    
    
    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!

    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //print(useLetters)
        //print(useLetters!)

        
        title = "Total de Senhas: \(numberOfPasswords)"
        passwordGenerator = PasswordGenerator(numberOfPasswords: numberOfPasswords, numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialLetters: useSpecialCharacters)

        generatePasswords()
    }
    
    func generatePasswords() {
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
    
    
}
