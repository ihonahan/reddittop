//
//  EntriesDataDelegateSource.swift
//  redittop
//
//  Created by Ihonahan Buitrago on 3/16/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

let entryCellIdentifier = "EntryCell"

class EntriesDataDelegateSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var entries : [Entry] = [Entry]()
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: entryCellIdentifier, for: indexPath)
        
        return cell
    }
    
}
