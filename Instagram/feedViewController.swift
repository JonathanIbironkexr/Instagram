//
//  feedViewController.swift
//  Instagram
//
//  Created by user142219 on 9/30/18.
//  Copyright © 2018 user142219. All rights reserved.
//

import UIKit

class feedViewController: UIViewController {
    
    class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.camera
        
        self.present(vc, animated: true, completion: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        print("Camera is available 📸")
        vc.sourceType = .camera
        } else {
        print("Camera 🚫 available so we will use photo library instead")
        vc.sourceType = .photoLibrary
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
