//
//  LoginViewController.swift
//  Instagram
//
//  Created by user142219 on 9/29/18.
//  Copyright © 2018 user142219. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
   
    @IBOutlet weak var usernamefield: UITextField!
    @IBOutlet weak var passwordfield: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Onsignin(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernamefield.text!, password: passwordfield.text!) { (user: PFUser?, error: Error?) in
            
            if user != nil {
                print("Sending you back in, happy Regraming!")
                self.performSegue(withIdentifier: "loginsegue", sender: nil)
                
            }
            
        }
    }
    
    @IBAction func Onsignup(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = usernamefield.text
        newUser.password = passwordfield.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                print("Yay! You're now on Restagram!")
                self.performSegue(withIdentifier: "loginsegue", sender: nil)            }else{
                print(error?.localizedDescription)
                if error?._code == 202 {
                    print("Yikes, that username is taken!")
                }
            }
        }
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
