//
//  CommentTableViewCell.swift
//  Instagram
//
//  Created by 勝木えり on 2019/03/04.
//  Copyright © 2019 eri.katsuki. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func setCommentData(_ commentData: CommentData) {
        
        self.nameLabel.text = "\(commentData.userName!)"
        self.commentTextView.text = "\(commentData.comment!)"
        self.dateLabel.text = "\(commentData.date!)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: commentData.date!)
        self.dateLabel.text = dateString
    }
    
    
    
}
