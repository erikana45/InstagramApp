//
//  CommentViewController.swift
//  Instagram
//
//  Created by 勝木えり on 2019/03/08.
//  Copyright © 2019 eri.katsuki. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class CommentViewController: UIViewController {
    
    var postId : String = ""
    var postArray: [PostData] = []
    var postdata : PostData?
    
    @IBOutlet weak var comments: UITextField!
    @IBOutlet weak var postComments: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func postComments(_ sender: Any) {
        let commentsuser = Auth.auth().currentUser?.displayName
        let uid = Auth.auth().currentUser?.uid
        
        let postRef = Database.database().reference().child(Const.PostPath).child((postdata?.id!)!)
        
        let comment:String = commentsuser! + ":" + self.comments.text!
        
        self.comments.append(comment)
        
        postRef.updateChildValues(["comments":self.comments])
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    @IBAction func backButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
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
