//
//  UIImage+Extensions.swift
//  redittop
//
//  Created by Ihonahan Buitrago on 3/17/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

typealias imageDownloaded = (_ result: UIImage?) -> ()

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImage {

    
    static func loadCachedImage(with urlString: String, completionHandler: @escaping imageDownloaded) {
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            completionHandler(cachedImage)
        }
        
        let session = URLSession.shared
        
        let url = URL(string: urlString)
        
        let task = session.dataTask(with: url!, completionHandler: { (data, response, error) -> Void in
            
            guard (error != nil) else {
                completionHandler(nil)
                return
            }
            
            if let image = UIImage(data: data!) {
                DispatchQueue.main.async(execute: { () -> Void in
                    imageCache.setObject(image, forKey: urlString as AnyObject)
                    completionHandler(image)
                })
            }
            
        })
        
        task.resume()
    }
    
}
