//
//  ViewController.swift
//  quitting time
//
//  Created by sudo on 4/21/17.
//  Copyright © 2017 sudo. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    var timeUrOff: String = ""
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isIdleTimerDisabled = true
        // Do any additional setup after loading the view,
        
        textBox.becomeFirstResponder()
        Jello.isHidden = true
        TimeToLEave.isHidden = true
        
        
        // MARK: - dismisskeyboard interactively
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.DismissKeyboard))
        view.addGestureRecognizer(tap)


        
    }
    // MARK: - Outlets
    
    @IBOutlet weak var WhatTimeAreOff: UILabel!
    @IBOutlet weak var Jello: UILabel!
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var PleaseInclude: UILabel!
    @IBOutlet weak var EnterText: UIButton!
    @IBOutlet weak var TimeToLEave: UIButton!
    @IBOutlet weak var timerectangle: UIImageView!
    @IBOutlet weak var PleaseIncludeRect: UIImageView!
    @IBOutlet weak var starterRectangle: UIImageView!
    
    
    
    @IBAction func textRecieved(_ sender: UITextField) {
        print(sender)
    }
    
    
    // MARK: - Actions
    @IBAction func HeyIsItFive(_ sender: UIButton) {
        print(Date().mediumTime)
        if (Date().mediumTime >= "\(timeUrOff) PM" && timeUrOff != "")   {
            timerectangle.isHidden = false
            PleaseIncludeRect.isHidden = false
            Jello.isHidden = false
            self.PleaseInclude.alpha = 1
            PleaseInclude.text = "It's time to go home 👍"
            PleaseInclude.isHidden = false
            TimeToLEave.isHidden = true
            
            TimeToFade()
            
            
            
            
        } else {
            TimeToFade()
            Jello.isHidden = true
            self.PleaseInclude.alpha = 1
            PleaseInclude.text = "Yikes, It's not time to go home yet. Keep working"
            PleaseInclude.isHidden = false
        }
        
    }
    
    @IBAction func enterNumber(_ sender: UIButton) {
        timeUrOff = textBox.text!
        if (timeUrOff == "") {
            WhatTimeAreOff.isHidden = false
            PleaseInclude.text = "Please include AM/PM"
            WhatTimeAreOff.text = "What time are you off?"
            textBox.isHidden = false
            EnterText.isHidden = false
            TimeToLEave.isHidden = false
            Jello.isHidden = true
            self.PleaseInclude.alpha = 1
            PleaseInclude.isHidden = false
            textBox.text = ""
            TimeToLEave.isHidden = true
            
        } else {
            starterRectangle.isHidden = true
            PleaseIncludeRect.isHidden = false
            timeUrOff = textBox.text!
            PleaseInclude.text = "Cool! We got it 😀"
            WhatTimeAreOff.isHidden = true
            textBox.isHidden = true
            EnterText.isHidden = true
            textBox.resignFirstResponder()
            TimeToLEave.isHidden = false
            TimeToFade()
            
            
            
            
        }
        
        
        
    }
    @IBAction func resetNow(_ sender: UIBarButtonItem) {
        timerectangle.isHidden = true
        starterRectangle.isHidden = false
        WhatTimeAreOff.isHidden = false
        PleaseIncludeRect.isHidden = true
        PleaseInclude.text = "Please include AM/PM"
        WhatTimeAreOff.text = "What time are you off?"
        textBox.isHidden = false
        EnterText.isHidden = false
        TimeToLEave.isHidden = true
        Jello.isHidden = true
        self.PleaseInclude.alpha = 1
        PleaseInclude.isHidden = false
        textBox.text = ""
        
    }
    
    func TimeToFade()  {
        UIView.animate(withDuration: 2, delay:2, options:UIViewAnimationOptions.transitionFlipFromTop, animations: {
            self.PleaseInclude.alpha = 0
        }, completion: { finished in
            self.PleaseInclude.isHidden = true
            self.PleaseIncludeRect.isHidden = true
        })
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}

