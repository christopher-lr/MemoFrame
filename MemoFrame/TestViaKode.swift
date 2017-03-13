//
//  TestViaKode.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 13.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation
import UIKit

class TestViaKode: UIViewController {
    
    @IBOutlet weak var beskrivelse: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func infoKnapp(_ sender: Any) {
        
        beskrivelse.text = "Her kan du utføre tester ved hjelp av kode du har fått av en administrerende bruker. Tast inn koden og trykk på ''start test'', og du vil få muligheten til å ta tilsvarende test."
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

