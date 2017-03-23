//
//  Hovedmeny.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 13.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation
import UIKit

class Hovedmeny: UIViewController {
    
    // MARK: Ikoner
    @IBOutlet weak var testerIkon: UIImageView!
    @IBOutlet weak var testresultaterIkon: UIImageView!
    @IBOutlet weak var brukerIkon: UIImageView!
    @IBOutlet weak var instillingerIkon: UIImageView!
    
    // MARK: Knapper
    @IBOutlet weak var testerKnapp: UIButton!
    @IBOutlet weak var testresultaterKnapp: UIButton!
    @IBOutlet weak var brukerKnapp: UIButton!
    @IBOutlet weak var instillingerKnapp: UIButton!
    
    var info : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setter tilsvarende ikoner
        testerIkon.image = UIImage (named:"puzzle")
        testresultaterIkon.image = UIImage (named:"resultater")
        brukerIkon.image = UIImage (named:"man-user")
        instillingerIkon.image = UIImage (named:"settings")
        
        // setter tilsvarende knapper
        testerKnapp.layer.cornerRadius = 2
        testerKnapp.layer.borderWidth = 2
        testerKnapp.layer.borderColor = UIColor.init(red: 46/255, green: 204/255, blue: 113/255, alpha: 0.75).cgColor
        
        testresultaterKnapp.layer.cornerRadius = 2
        testresultaterKnapp.layer.borderWidth = 2
        testresultaterKnapp.layer.borderColor = UIColor.init(red: 155/255, green: 89/255, blue: 182/255, alpha: 0.75).cgColor
        
        brukerKnapp.layer.cornerRadius = 2
        brukerKnapp.layer.borderWidth = 2
        brukerKnapp.layer.borderColor = UIColor.init(red: 52/255, green: 152/219, blue: 168/255, alpha: 0.75).cgColor
        
        instillingerKnapp.layer.cornerRadius = 2
        instillingerKnapp.layer.borderWidth = 2
        instillingerKnapp.layer.borderColor = UIColor.init(red: 52/255, green: 73/255, blue: 94/255, alpha: 0.75).cgColor
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
