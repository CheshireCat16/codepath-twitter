//
//  TweetViewController.swift
//  Twitter
//
//  Created by John Cheshire on 2/27/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tweetTextView: UITextView!
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if (!tweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("error posting tweet \(error)")
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    


}
