//
//  LoginViewController.swift
//  Twitter
//
//  Created by Asarel Castellanos on 9/29/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        let twitterUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: twitterUrl, success: {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
        }, failure: { Error in
            print("could not log in!")
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
