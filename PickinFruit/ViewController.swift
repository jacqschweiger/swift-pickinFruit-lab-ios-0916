//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍", "🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍", "🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
        resultLabel.isHidden = true
        
    }
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        
        resultLabel.isHidden = false
        
        var randomNumber = Int(arc4random_uniform(UInt32(9)))
        fruitPicker.selectRow(randomNumber, inComponent: 0, animated: true)
        let result1 = fruitPicker.selectedRow(inComponent: 0)
        
        randomNumber = Int(arc4random_uniform(UInt32(9)))
        fruitPicker.selectRow(randomNumber, inComponent: 1, animated: true)
        let result2 = fruitPicker.selectedRow(inComponent: 1)
        
        randomNumber = Int(arc4random_uniform(UInt32(9)))
        fruitPicker.selectRow(randomNumber, inComponent: 2, animated: true)
        let result3 = fruitPicker.selectedRow(inComponent: 2)
        
        if result1 == result2 && result1 == result3 {
            resultLabel.text = "WINNER!"
        } else {
            resultLabel.text = "TRY AGAIN"
        }

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = fruitsArray[row]
        return title
    }
 
    
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.white.cgColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



