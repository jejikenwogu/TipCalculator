//
//  ViewController.swift
//  Tip Calculator
//
//  Created by John Ejike-Nwogu on 1/14/15.
//  Copyright (c) 2015 John Ejike-Nwogu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = "$0.00";
        totalLabel.text = "$0.00";
    }
    
    override func viewWillAppear(animated: Bool) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTip = defaults.floatForKey("defaultTip");
        tipSlider.setValue(defaultTip, animated: false);
        onSliderEditingChanged();
    }

    @IBAction func onEditChanging() {
        var billAmount = stringToFloat(billField.text);
        var tipPercentage = tipSlider.value ;
        var tip = billAmount * tipPercentage / 100;
        var total = billAmount + tip;
        
        tipLabel.text = formatCurrency(tip);
        totalLabel.text = formatCurrency(total);
    }
    
    
    @IBAction func onSliderEditingChanged() {
        var tipPercentage = tipSlider.value;
        var roundedTipPercentage = round(tipPercentage);
        
        tipSlider.setValue(roundedTipPercentage, animated: false);
        tipPercentageLabel.text = "\(roundedTipPercentage)%";
        //TODO: move tipPercentageLabel along with the slider's knob
        
        onEditChanging();
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
    
    //would normally break these 2 functions out into their own utility classes
    func formatCurrency(currency:Float)->NSString {
        return String(format: "$%.2f", currency);
    }
    
    func stringToFloat(string:String)->Float {
        return (string as NSString).floatValue;
    }

}

