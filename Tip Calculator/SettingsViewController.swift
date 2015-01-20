//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by John Ejike-Nwogu on 1/19/15.
//  Copyright (c) 2015 John Ejike-Nwogu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipLabel: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTip = defaults.floatForKey("defaultTip");
        
        tipLabel.text = String("\(defaultTip)");
    }
    
    @IBAction func onSaveClicked(sender: AnyObject) {
        var defaultTip = (tipLabel.text as NSString).floatValue;
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(defaultTip, forKey: "defaultTip");
        
        done();
    }
    
    @IBAction func onCancelClicked(sender: AnyObject) {
        done();
    }
    
    func done() {
        dismissViewControllerAnimated(true, completion: nil);
    }

}
