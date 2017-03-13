//
//  Facebook.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 10.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation
import UIKit

class Facebook: UIViewController {
    
    @IBOutlet weak var feilmelding: UILabel!
  
    @IBOutlet weak var facebookIkon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feilmelding.isHidden = true
        
        facebookIkon.image = UIImage (named: "facebook")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
