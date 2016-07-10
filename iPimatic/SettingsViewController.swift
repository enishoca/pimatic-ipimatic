//
//  SettingsViewController.swift
//  iPimatic
//
//  MIT License
//  Created by Enis Hoca on 7/10/16.
//  Copyright © 2016 Enis Hoca (enishoca@outlook.com). All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software
//  and associated documentation files (the "Software"), to deal in the Software without restriction,
//  including without limitation the rights to use, copy, modify, merge, publish, distribute,
//  sublicense, and/or sell copies of the Software, and to permit persons to
//  whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
//  PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
//  FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
//  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import UIKit

class SettingsViewController: UIViewController, UIWebViewDelegate {
    
 
    @IBOutlet weak var update: UIButton!
    @IBOutlet weak var URL: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        var url = defaults.URLForKey("url")
        
        if (url != nil) {
            URL.text = url?.absoluteString
        }
        else {
            url = NSURL(string: "http://192.168.0.112:8090")
            print ("not found - storing default")
            defaults.setURL(NSURL(string: "http://192.168.0.112:8090"), forKey: "url")
        }

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func update(sender: AnyObject) {
        let urltext = self.URL.text
        let defaults = NSUserDefaults.standardUserDefaults()
        let url = NSURL(string: urltext!)
        defaults.setURL(url, forKey: "url")
    }

}
