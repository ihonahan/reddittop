//
//  TopListViewController.swift
//  redittop
//
//  Created by Ihonahan Buitrago on 3/16/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class TopListViewController: UIViewController, EntriesDataDelegate {
    @IBOutlet weak var fullContainer : UIView!
    @IBOutlet weak var topListTable : UITableView!
    @IBOutlet weak var backgroundImage : UIImageView!
    
    @IBOutlet weak var loadingContainer : UIView!
    @IBOutlet weak var loadingFXView : UIVisualEffectView!
    @IBOutlet weak var loadingView : UIActivityIndicatorView!
    
    @IBOutlet weak var delegateDatasource : EntriesDataDelegateSource!
    
    var afterId : String?
    var beforeId : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadingContainer.isHidden = true
        self.fullContainer.sendSubview(toBack: self.loadingContainer)

        self.delegateDatasource.table = self.topListTable
        self.delegateDatasource.delegate = self

        self.showLoading()
        ConnectionWrapper.getTopReddits(after: self.afterId, before: self.beforeId) { (success, resultEntries) in 
            
            if success {
                self.delegateDatasource.getNewEntries(resultEntries: resultEntries)
            }
            
            self.hideLoading()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showLoading() {
        self.loadingContainer.alpha = 0
        self.loadingContainer.isHidden = false
        
        self.loadingView.startAnimating()
        self.fullContainer.bringSubview(toFront: self.loadingContainer)
        
        UIView.animate(withDuration: 0.3) { 
            self.loadingContainer.alpha = 1
        }
    }
    
    func hideLoading() {
        UIView.animate(withDuration: 0.3, animations: { 
            self.loadingContainer.alpha = 0
        }) { (finished) in
            self.loadingView.stopAnimating()
            self.loadingContainer.isHidden = true
            self.fullContainer.sendSubview(toBack: self.loadingContainer)
        }
    }
    

    //MARK: - EntriesDataDelegate methods
    func entriesDataDelegateRequestShowImage(sender: EntriesDataDelegateSource, imageUrl: String) {
        self.showLoading()
        UIImage.loadCachedImage(with: imageUrl) { (image) in
            if let img = image {
                self.performSegue(withIdentifier: "modalFullImage", sender: img)
            }
            
            self.hideLoading()
        }
    }
    
    func entriesDataDelegateFinishDataLoad(sender: EntriesDataDelegateSource) {
        self.hideLoading()
    }

    
    //MARK: - Navigation Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "modalFullImage" {
            if let image = sender as? UIImage {
                if let destinationVC = segue.destination as? FullImageViewController {
                    destinationVC.image = image
                }
            }
        }
    }
}
