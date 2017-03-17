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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
