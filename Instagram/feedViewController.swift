//
//  feedViewController.swift
//  Instagram
//
//  Created by user142219 on 9/30/18.
//  Copyright © 2018 user142219. All rights reserved.
//

import UIKit
import Parse


class feedViewController: UIViewController {
    
    @IBOutlet weak var mainfeedview: UIImageView!
    @IBOutlet weak var logoutb: UIButton!
    
    class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        func postsfeed(){
        // construct PFQuery
        let query = Post.query()
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [Post]?, error: NSError?) -> Void in
        if let posts = posts {
        // do something with the data fetched
        } else {
        // handle error
        }
        }
        }
    }
        
        
        
        
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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


