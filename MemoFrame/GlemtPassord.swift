//
//  GlemtPassord.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 10.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation
import UIKit

class GlemtPassord: UIViewController {
    
    @IBOutlet weak var beskrivelse: UILabel!
    @IBOutlet weak var epostInput: UITextField!
    @IBOutlet weak var feilmelding: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beskrivelse.text = "Vennligst skriv inn gyldig e-mail adresse under for å få tilsendt et midlertidig passord på e-mail for å denne brukeren. "
        
        feilmelding.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
