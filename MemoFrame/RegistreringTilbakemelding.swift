//
//  RegistreringTilbakemelding.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 10.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation
import UIKit

class RegistreringTilbakemelding: UIViewController {
    
    //var passedData: Bruker -> egentlig skal ta imot en brukerklasse og bruke dets get metoder for å putte i de ulike labelene
    
    @IBOutlet weak var epostTilbakemelding: UILabel!
    @IBOutlet weak var fodselsaar: UILabel!
    @IBOutlet weak var kjonn: UILabel!
    @IBOutlet weak var land: UILabel!
    
    var passedData: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        epostTilbakemelding.text = passedData
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
