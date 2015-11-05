//
//  ViewController.swift
//  IOS8SwiftNSUserDefaultsTutorial
//
//  Created by ivs on 11/5/15.
//  Copyright © 2015 ivs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bluetoothSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("this is view did load!")
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey("SwitchState") != nil) {
            bluetoothSwitch.on = defaults.boolForKey("SwitchState")
        }
        
        if (defaults.objectForKey("countForRate") != nil) {
            let a = defaults.objectForKey("countForRate")
            var b: Int = (a?.integerValue)!
            ++b;
            defaults.setInteger(b, forKey: "countForRate")
            print(b)
            if(b%5 == 0) {
                print("this is 5")
            }
            
        } else {
            defaults.setInteger(1, forKey: "countForRate")
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        print("this is view Will Appear!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveSwitchState(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if bluetoothSwitch.on {
            defaults.setBool(true, forKey: "SwitchState")
            
        } else {
            defaults.setBool(false, forKey: "SwitchState")
        }
    }

}

