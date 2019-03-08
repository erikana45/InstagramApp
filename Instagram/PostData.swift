//
//  PostData.swift
//  Instagram
//
//  Created by 勝木えり on 2019/02/21.
//  Copyright © 2019 eri.katsuki. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PostData: NSObject {
    var id: String?
    var image: UIImage?
    var imageString: String?
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    var comments: [String] = [] //課題用に追加。CommentDataで別管理しようとすると、画像のない投稿としてエラーになった
    var commentsuser:[String] = []//課題用に追加
    
    init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: Any]
        
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: Data(base64Encoded: imageString!, options: .ignoreUnknownCharacters)!)
        
        self.name = valueDictionary["name"] as? String
        
        self.caption = valueDictionary["caption"] as? String
        
        let time = valueDictionary["time"] as? String
        self.date = Date(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
        
        
        //likeの書き込みを保存
        if let likes = valueDictionary["likes"] as? [String] {
            self.likes = likes
        }
        
        for likeId in self.likes {
            if likeId == myId {
                self.isLiked = true
                break
            }
        }
        
        //課題用：コメントの保存
        if let comments = valueDictionary["comments"] as? [String] {
            self.comments = comments
        }
        
        //課題用：コメントしたユーザー名の保存
        if let commentsuser = valueDictionary["commentsuser"] as? [String] {
            self.commentsuser = commentsuser
        }
        
        
        
    }
}
