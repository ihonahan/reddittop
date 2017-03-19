//
//  ConnectionWrapper.swift
//  redittop
//
//  Created by Ihonahan Buitrago on 3/17/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

typealias CompletionHandler = (_ success: Bool, _ jsonResponse: [Entry]) -> ()

class ConnectionWrapper: NSObject {
    
    static let baseUrl = "https://www.reddit.com/"
    static let topService = ".json"

    static func getTopReddits(after: String?, completionHandler: @escaping CompletionHandler) {
        let session = URLSession.shared
        var composedUrl = "\(ConnectionWrapper.baseUrl)\(ConnectionWrapper.topService)"
        
        if let afterValue = after {
            composedUrl += "?after=\(afterValue)"
        } 
        
        let url = URL(string: composedUrl)
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            guard (error == nil) else {
                completionHandler(false, [])
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                let entries = Entry.jsonToEntries(json: json)
                
                completionHandler(true, entries)
            } catch {
                completionHandler(false, [])
                return
            }
            
        }
        
        task.resume()
    }
}
