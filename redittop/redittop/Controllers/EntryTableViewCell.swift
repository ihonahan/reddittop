//
//  EntryTableViewCell.swift
//  redittop
//
//  Created by Ihonahan Buitrago on 3/16/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

protocol EntryTableViewCellDelegate {
    func entryTableViewCellDidTappedThumb(sender: EntryTableViewCell, entry: Entry)
}

class EntryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fullContainer : UIView!
    @IBOutlet weak var arrowsImageView : UIImageView!
    @IBOutlet weak var upVotesLabel : UILabel!
    @IBOutlet weak var thumbImageView : UIImageView!
    @IBOutlet weak var thumbButton : UIButton!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var authorLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var commentsLabel : UILabel!
    
    weak var entry : Entry!
    var delegate : EntryTableViewCellDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func tapUpThumb(sender: UIButton) {
        if let del = self.delegate {
            del.entryTableViewCellDidTappedThumb(sender: self, entry: self.entry!)
        }
    }
}
