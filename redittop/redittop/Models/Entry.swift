//
//  Entry.swift
//  redittop
//
//  Created by Ihonahan Buitrago on 3/16/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class Entry {
    var identifier : String = ""
    var title : String = ""
    var author : String = ""
    var date : Date = Date()
    var thumb : String = ""
    var numberOfComments : Int = 0
    var upVotes : Int = 0
    var urlImage : String = ""
    
    static func jsonToEntries(json: [String: AnyObject]) -> [Entry] {
        var result = [Entry]()
        
        if let data = json["data"] as? [String: AnyObject] {
            if let children = data["children"] as? [[String: AnyObject]] {
                for child in children {
                    if let childData = child["data"] as? [String:AnyObject] {
                        let entry = Entry()
                        if let idString = childData["id"] as? String {
                            entry.identifier = idString
                        }
                        if let titleString = childData["title"] as? String {
                            entry.title = titleString
                        }
                        if let authorString = childData["author"] as? String {
                            entry.author = authorString
                        }
                        if let thumbString = childData["thumbnail"] as? String {
                            entry.thumb = thumbString
                        }
                        if let commentsNumber = childData["num_comments"] as? Int {
                            entry.numberOfComments = commentsNumber
                        }
                        if let votesNumber = childData["ups"] as? Int {
                            entry.upVotes = votesNumber
                        }
                        if let urlString = childData["url"] as? String {
                            entry.urlImage = urlString
                        }
                        if let dateNumber = childData["created"] as? TimeInterval {
                            entry.date = Date(timeIntervalSince1970: dateNumber)
                        }
                        
                        result.append(entry)
                    }
                }
            }
        }
        
        return result
    }
}
