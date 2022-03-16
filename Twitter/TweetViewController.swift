//
//  TweetViewController.swift
//  Twitter
//
//  Created by Spencer Steggell on 3/15/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var enteredTweet: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        enteredTweet.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if(!enteredTweet.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: enteredTweet.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }

}
