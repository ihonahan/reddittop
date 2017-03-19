//
//  FullImageViewController.swift
//  redittop
//
//  Created by Ihonahan Buitrago on 3/17/17.
//  Copyright © 2017 Ihonahan Buitrago. All rights reserved.
//

import UIKit

class FullImageViewController: UIViewController {
    
    @IBOutlet weak var fullContainer : UIView!
    @IBOutlet weak var fxContainer : UIVisualEffectView!
    @IBOutlet weak var imageView : UIImageView!
    
    var tapGesture : UITapGestureRecognizer!
    var image : UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTapGesture(gesture:)))
        self.tapGesture.numberOfTapsRequired = 1
        self.fullContainer.addGestureRecognizer(self.tapGesture)
        
        self.fullContainer.alpha = 0
        self.imageView.image = self.image
        
        self.perform(#selector(self.showAnimated), with: nil, afterDelay: 0.1)
    }
    
    func showAnimated() {
        UIView.animate(withDuration: 0.3) {
            self.fullContainer.alpha = 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func handleTapGesture(gesture: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.3,
                       animations: {
                        self.fullContainer.alpha = 0
        }) { (finished) in
            self.dismiss(animated: false) {
                
            }
        }
    }

}
