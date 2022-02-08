//
//  EmojiTableViewCell.swift
//  EmojiReader
//
//  Created by o11ev on 08.02.2022.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(object: Emoji) {
        self.nameLabel.text = object.name
        self.emojiLabel.text = object.emoji
        self.descriptionLabel.text = object.description
    }

}
