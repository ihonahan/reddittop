//
//  TopListViewController.swift
//  redittop
//
//  Created by Ihonahan Buitrago on 3/16/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class TopListViewController: UIViewController {
    @IBOutlet weak var fullContainer : UIView!
    @IBOutlet weak var topListTable : UITableView!
    @IBOutlet weak var backgroundImage : UIImageView!
    
    @IBOutlet weak var delegateDatasource : EntriesDataDelegateSource!
    
    var afterId : String?
    var beforeId : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegateDatasource.table = self.topListTable

        ConnectionWrapper.getTopReddits(after: self.afterId, before: self.beforeId) { (success, resultEntries) in 
            
            if success {
                self.delegateDatasource.getNewEntries(resultEntries: resultEntries)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
