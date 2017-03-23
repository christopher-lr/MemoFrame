//
//  Informasjon.swift
//  MemoFrame
//
//  Created by Christopher Reyes on 10.03.2017.
//  Copyright © 2017 Christopher Reyes. All rights reserved.
//

import Foundation
import UIKit

class Informasjon: UIViewController {
    
    @IBOutlet weak var beskrivelse: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beskrivelse.text = "MemoFrame er en applikasjon utviklet av Christopher Reyes, Muddasar Hussain, Zain Mushtaq og Raja Zulqurnine. Applikasjonen en en bacheloroppgave, og er laget for Asieh, Hugo og Anis som er nåværende arbeidsgivere og skal utvikle applikasjonen videre. \n\n Applikasjonen fungerer som et forskningsverktøy og treningsverktøy for demente personer."
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

