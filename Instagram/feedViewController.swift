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
    
    @IBOutlet weak var mainfeedtable: UITableView!
   
    @IBAction func logoutb2(_ sender: Any) {
        PFUser.logOutInBackground { (error) in
            if (error != nil) {
                print(error.debugDescription)
            }
        }
        self.performSegue(withIdentifier: "logoutSegue", sender: nil)
    }

    @IBAction func oncreatepost(_ sender: Any) {
        self.performSegue(withIdentifier: "uploadsegue", sender: nil)    }
    
    var refreshControl: UIRefreshControl!
    
    var posts: [postsViewController] = []
    
    class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
    }
    
        
       
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup pull-to-refresh functionality
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchPostsData), for: .valueChanged)
        mainfeedtable.insertSubview(refreshControl, at: 0)
        
        // Setup delegate, data source, and dimensions
        mainfeedtable.delegate = self as! UITableViewDelegate
        mainfeedtable.dataSource = self as! UITableViewDataSource
        mainfeedtable.rowHeight = UITableView.automaticDimension
        mainfeedtable.estimatedRowHeight = 100
        
        // Retrieve posts and update table view
        fetchPostsData()
        mainfeedtable.reloadData()        // Do any additional setup after loading the view.
    }
    
    @objc func fetchPostsData() {
        // Create New PFQuery
        let query = Post.query()
        query?.order(byDescending: "createdAt")
        query?.includeKey("author")
        query?.includeKey("createdAt")
        query?.limit = 20
        
        // Fetch data asynchronously
        query?.findObjectsInBackground(block: { (posts, error) in
            if let posts = posts {
                self.posts = posts as! [postsViewController]
                self.mainfeedtable.reloadData()
                self.refreshControl.endRefreshing()
            }
            else {
                print(error.debugDescription)
            }
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


