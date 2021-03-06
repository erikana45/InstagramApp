//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 勝木えり on 2019/02/21.
//  Copyright © 2019 eri.katsuki. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var commentButton: UIButton!//アイコン
    @IBOutlet weak var commentLabel: UILabel!//コメントと入力者を表示する
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func setPostData(_ postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        //DateFormatterクラスを生成し、dateFormatプロパティに、”yyy...”と設定
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        //自分がすでにいいねしているときはボタン差し替え
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
    
        //課題：コメントと記入者をラベルに表示する
        self.commentLabel.text = "\(postData.commentsuser) : \(postData.comments)"
        
        
    }
    
    
}
