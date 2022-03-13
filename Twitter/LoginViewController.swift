//
//  LoginViewController.swift
//  Twitter
//
//  Created by Spencer Steggell on 3/8/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
        
    }
    
    
    @IBAction func loginTwitter(_ sender: Any) {
        
        let loginUrl = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: loginUrl, success: {
            print("Login success!")
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }, failure: { Error in
            print("Unable to login")
        })
        
    }

}
