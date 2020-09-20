//
//  MessageCellTableViewCell.swift
//  FireChat
//
//  Created by Kyle L. on 7/1/20.
//  Copyright © 2020 Kyle L. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var messageBubble: UIView!
    
    @IBOutlet weak var meLabel: UIImageView!
    @IBOutlet weak var youLabel: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 5
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
