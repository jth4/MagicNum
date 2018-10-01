//
//  ViewController.swift
//  MagicNum
//
//  Created by jth4 on 3/4/18.
//  Copyright © 2018 jth4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wordInputField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
  
    
    var wordValueArray = [Int]()
    
    // Ad banner and interstitial views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordInputField.delegate = self
        
    }


    @IBAction func calculateTapped(_ sender: Any) {
        let trimmedInputText : String = wordInputField.text!.lowercased().replacingOccurrences(of: " ", with: "")
        let noPunc = trimmedInputText.components(separatedBy: CharacterSet.punctuationCharacters).joined()
        var noNum = noPunc.components(separatedBy: CharacterSet.decimalDigits).joined()
        
        for letter in noNum.utf8 {
            let letterValue = Int(letter - 96)
            wordValueArray.append(letterValue)
        }
        
        let summedArray = wordValueArray.reduce(0, {$0 + $1})
        textView.text = "The Magic Number is \(summedArray)"
        wordValueArray = [Int]()
    }
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
