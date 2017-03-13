//
//  KontaktOss.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 10.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation
import UIKit

class KontaktOss: UIViewController {
    
    @IBOutlet weak var beskrivelse: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beskrivelse.text = "Hvis du har noen spørsmål eller har lyst å gi tilbakemelding på applikasjonen vennligst send oss en kommentar og legg igjen e-mailen din så kontakter vi deg så fort som mulig."
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

