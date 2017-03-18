//
//  EntriesDataDelegateSource.swift
//  redittop
//
//  Created by Ihonahan Buitrago on 3/16/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

let entryCellIdentifier = "EntryCell"

protocol EntriesDataDelegate {
    func entriesDataDelegateRequestShowImage(sender: EntriesDataDelegateSource, imageUrl: URL)
}

class EntriesDataDelegateSource: NSObject, UITableViewDelegate, UITableViewDataSource, EntryTableViewCellDelegate {
    
    var entries : [Entry] = [Entry]()
    weak var table : UITableView!
    
    var delegate : EntriesDataDelegate!
    

    func getNewEntries(resultEntries: [Entry]) {
        let dispatch = DispatchQueue.main
        dispatch.async {
            self.entries.append(contentsOf: resultEntries)
            self.table.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.cellForRow(at: indexPath) as! EntryTableViewCell
        
        let height = cell.commentsLabel.frame.origin.y + cell.commentsLabel.frame.size.height + 2.0
        
        return height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: entryCellIdentifier, for: indexPath) as! EntryTableViewCell
        
        let entry = self.entries[indexPath.row]
        
        cell.titleLabel.text = entry.title
        cell.authorLabel.text = entry.author
        cell.commentsLabel.text = "\(entry.numberOfComments) comments"
        cell.upVotesLabel.text = "\(entry.upVotes)"
        UIImage.loadCachedImage(with: entry.thumb) { (image) in
            cell.thumbImageView.image = image
        }
        
        return cell
    }
    
    
    //MARK: - EntryTableViewCellDelegate methods
    func entryTableViewCellDidTappedThumb(sender: EntryTableViewCell, entry: Entry) {
        if let del = self.delegate {
            if let url = entry.urlImage {
                del.entriesDataDelegateRequestShowImage(sender: self, imageUrl: url)
            }
        }
    }
    
}
